/**
 * @description Class that monitors for updates to the definition 
 * files used in THQBY's AHK v2 addon for VS Code.  
 * Use the `Start()` and `Stop()` methods to control the auto-updater.  
 * @property {Integer} frequency - Set how often, in hours, to check for an update.  
 * Fractional numbers can be used: `1.5` = 1 hr 30 min  
 * Default is every 4 hours.  
 * @property {Integer} notify - Controls if TrayTip notifications show up.  
 * - `1` = Enable TrayTip notifications
 * - `0` = Disable TrayTip notifications
 * @property {Integer} update_updater - Enables/disables the auto-updater own auto-updater.
 * - `1` = Allow auto-updater to update itself.
 * - `0` = Prevent auto-updater from updating itself.
 */
class definition_enhancement_updater {
    static version := 1.3
    static frequency := 4
    static notify := 1
    static update_updater := 1
    
    static start() {
        this.running := 1
        this.run()
    }
    
    static stop() {
        this.running := 0
        this.run_again(1)
    }
    
    ; Internal stuff
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
    
    static __New() => this.start()
    
    static run() {
        if !this.running
            return
        this.announcement := ''
        
        this.get_addon_location()
        for id, data in this.file_list
            if (id = 'updater') && !this.update_updater
                continue
            else this.check_for_update(id, data)
        
        if this.announcement
            TrayTip(this.announcement
                'Reload VS Code for changes to take effect.')
        
        this.run_again()
    }
    
    static run_again(stop:=0) {
        callback := ObjBindMethod(this, 'run')
        if stop
            SetTimer(callback, 0)
        else SetTimer(callback, Abs(this.frequency * 3600000) * -1)
    }
    
    static check_for_update(id, data) {
        if (id = 'updater')
            file_path := A_ScriptFullPath
        else file_path := this.addon_path '\syntaxes\' data['filename']
        
        online_txt := this.get_http(data['url'])
        ,online_ver := this.get_version(online_txt, data)
        
        for index, install_num in this.get_version(FileRead(file_path), data)
            if (index = 0)
                continue
            else if (online_ver[index] > install_num) {
                FileDelete(file_path)
                FileAppend(online_txt, file_path, 'UTF-8-RAW')
                this.announcement .= data['filename'] ' has been updated.`n'
                break
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
            
            this.addon_path := path
        }
        return
        
        ask_user() => DirSelect('*' A_AppData,
                , 'Select the "extensions" folder in the ".vscode" main folder. '
                '`nThe default install folder is normally:'
                '`nC:\Users\<USERNAME>\.vscode\extensions')
    }
    
    static notify_user(msg) {
        if this.notify
            TrayTip(msg)
    }
    
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
        web := ComObject('WinHttp.WinHttpRequest.5.1')
        web.Open('GET', url)
        web.Send()
        web.WaitForResponse()
        return web.ResponseText
    }
}
