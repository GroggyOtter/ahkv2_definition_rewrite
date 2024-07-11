/**
 * @description Class that monitors for updates to the definition 
 * files used in THQBY's AHK v2 addon for VS Code.  
 * Use the `Start()` and `Stop()` methods to control the auto-updater.  
 * @property {Integer} frequency - Set how often, in hours, to check for an update.  
 * Fractional numbers can be used:  
 * - `1.5` = 1 hr 30 min  
 * - `0.1` = 6 min  
 * Default is `4` hours.  
 * @property {Integer} notify - Controls if TrayTip notifications show up.  
 * - `1` = Enable TrayTip notifications
 * - `0` = Disable TrayTip notifications
 * @property {Integer} update_updater - Enables/disables the auto-updater's own auto-updater.
 * - `1` = Allow auto-updater to update itself.
 * - `0` = Prevent auto-updater from updating itself.
 */
class _def_enhance_updater {
    static version := 1.6
    static frequency := 4
    static notify := 1
    static update_updater := 1
    
    /**
     * Run the updater and check regularly on a timer.  
     */
    static start(*) {
        this.running := 1
        this.run()
    }
    
    /**
     * Stops the updater and cancels all timers.  
     */
    static stop(*) {
        this.running := 0
        this.run_again('stop')
    }
    
    /**
     * Forces an update check immediately.  
     * If running status is false, the timer is disabled after the update check.  
     * If running status is true, the timer will start fresh after the update check.  
     */
    static force_check(*) {
        running := this.running
        this.start()
        if !running
            this.stop()
    }
    
    static file_list := Map(
        'dahk', Map(
            'url'     , 'https://raw.githubusercontent.com/GroggyOtter/ahkv2_definition_rewrite/main/ahk2.d.ahk',
            'filename', 'ahk2.d.ahk',
            'filetype', 'AHK File (*.ahk)',
            'rgx_ver' , ';@region v(\d+)\.(\d+)',
            'def_ver' , ';@region v1.0'
        ),
        'json', Map(
            'url'     , 'https://raw.githubusercontent.com/GroggyOtter/ahkv2_definition_rewrite/main/ahk2.json',
            'filename', 'ahk2.json',
            'filetype', 'JSON File (*.json)',
            'rgx_ver' , '"version": +(\d+)\.(\d+)',
            'def_ver' , '"version": 1.0'
        ),
        'updater', Map(
            'url'     , 'https://raw.githubusercontent.com/GroggyOtter/ahkv2_definition_rewrite/main/definition_updater.v2.ahk',
            'filename', 'definition_updater.v2.ahk',
            'rgx_ver' , 'static version := (\d+)\.(\d+)',
            'def_ver' , 'static version := 1.0'
        )
    )
    
    static running := 0
    static addon_path := ''
    static announcement := ''
    
    static __New() {
        m := A_TrayMenu
        m.Insert('10&')
        m.Insert('11&', 'Start Definition Updater', ObjBindMethod(this, 'start'))
        m.Insert('12&', 'Stop Definition Updater', ObjBindMethod(this, 'stop'))
        m.Insert('13&')
        m.Insert('14&', 'Force Definition Update', ObjBindMethod(this, 'force_check'))
        m.Insert('15&')
        this.start()
    }
    
    static run(*) {
        this.announcement := ''
        if !this.running
            return
        if !DirExist(this.addon_path)
            this.addon_path := this.get_addon_location()
        for id, data in this.file_list
            if (id = 'updater') && !this.update_updater
                continue
            else try this.check_for_update(id, data)
        
        if this.announcement
            TrayTip(this.announcement
                'Reload VS Code for changes to take effect.')
        
        this.run_again()
    }
    
    static run_again(stop:=0) {
        period := stop ? 0 : Abs(this.frequency * 3600000) * -1
        SetTimer(ObjBindMethod(this, 'run'), period)
    }
    
    static check_for_update(id, data) {
        if (id = 'updater')
            file_path := A_ScriptFullPath
        else file_path := this.addon_path '\syntaxes\' data['filename']
        install_ver := this.get_version(FileRead(file_path), data)
        online_txt := this.get_http(data['url'])
        if !online_txt
            return
        online_ver := this.get_version(online_txt, data)
        for index, install_num in install_ver {
            if (index = 0)
                continue
            else if (online_ver[index] > install_num) {
                name := data['filename']
                msg := 'Update available for : ' name
                    . '`nNew Version: v' online_ver[1] '.' online_ver[2]
                    . '`nCurrent Version: v' install_ver[1] '.' install_ver[2]
                    . '`n`nDo you want to update/overwrite this file: '
                    . '`nThis will move the original file to the recycle bin and replace it with the current one.'
                    . '`n`nLocation: ' file_path
                if (MsgBox(msg, 'AHK Definition Enhancement Update: ' name, 'YesNo') = 'No')
                    continue
                FileRecycle(file_path)
                FileAppend(online_txt, file_path, 'UTF-8-RAW')
                this.announcement .= name ' has been updated.`n'
                break
            }
        }
    }
    
    static get_addon_location() {
        addon_path_default := A_AppData '\..\..\.vscode\extensions'
        thqby_rgx := 'thqby\.vscode-autohotkey2-lsp-(\d+)\.(\d+)\.(\d+)'
        while !DirExist(this.addon_path) {
            check_again:
            path := ''
            v_list := []
            loop files addon_path_default '\*', 'D'
                if RegExMatch(A_LoopFileFullPath, thqby_rgx)
                    v_list.Push(A_LoopFileFullPath)
            
            if (v_list.Length = 0) {
                addon_path_default := ask_user()
                if (addon_path_default = '')
                    TrayTip('Addon location is not set.`nUpdate check is being skipped.')
                    ,Exit()
                goto('check_again')
            } else if (v_list.Length = 1)
                path := v_list[1]
            else 
                for value in v_list
                    path := this.get_most_recent(value, path, thqby_rgx)
            return path
        }
        
        ask_user() => DirSelect('*' A_AppData,
                , 'Select the "extensions" folder in the ".vscode" main folder. '
                '`nThe default install folder is normally:'
                '`nC:\Users\<USERNAME>\.vscode\extensions')
    }
    
    static notify_user(msg) => this.notify ? TrayTip(msg) : 0
    
    static get_version(txt, data) {
        if !RegExMatch(txt, data['rgx_ver'], &match)
            RegExMatch(data['def_ver'], data['rgx_ver'], &match)
        return match
    }  
    
    static get_most_recent(v1, v2, version_rgx) {
        switch {
            case !v1: return v2
            case !v2: return v1
            case !RegExMatch(v1, version_rgx, &match1): return v2
            case !RegExMatch(v2, version_rgx, &match2): return v1
            default: 
                for key, value in match1
                    if (key = 0)
                        continue
                    else if (match2[key] > value)
                        return v2
                    else if (match2[key] < value)
                        return v1
                return v1
        }
    }
    
    static error(msg) {
        if this.notify
            TrayTip(msg)
    }
    
    static get_http(url) {
        timeout := 5
        web := ComObject('WinHttp.WinHttpRequest.5.1')
        web.Open('GET', url)
        web.Send()
        if web.WaitForResponse(timeout)
            return web.ResponseText
        return 0
    }
}
