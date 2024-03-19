/**
 * @description Class that monitors for updates to the definition 
 * files used in THQBY's AHK v2 addon for VS Code.  
 * Use the `Start()` and `Stop()` methods to control the auto-updater.  
 * @property {Integer} frequency - Set how often, in hours, to check for an update.  
 * Fractional numbers can be used: `1.5` = 1 hr 30 min  
 * Default is every 4 hours.  
 * @property {Integer} notify - Controls if TrayTip notifications show up.  
 * - `1` = 
 */
class definition_enhancement_updater {
    static version := 1.1
    static frequency := 4
    static notify := 1
    
    static start() {
        this.running := 1
        this.run()
    }
    
    static stop() {
        this.running := 0
        this.run_again(1)
    }
    
    ; Internal stuff
    static rgx := Map(
        'lsp_ver',  'lsp-(\d+)\.(\d+)\.(\d+)',
        'thqby',    'thqby.*?lsp'
    )
    
    static file_list := Map(
        'dahk', Map(
            'url'     , 'https://raw.githubusercontent.com/GroggyOtter/ahkv2_definition_rewrite/main/ahk2.d.ahk',
            'filename', 'ahk2.d.ahk',
            'filepath', '',
            'filetype', 'AHK File (*.ahk)',
            'rgx_ver' , ';@region v(\d+)\.(\d+)'
        ),
        'json', Map(
            'url'     , 'https://raw.githubusercontent.com/GroggyOtter/ahkv2_definition_rewrite/main/ahk2.json',
            'filename', 'ahk2.json',
            'filepath', '',
            'filetype', 'JSON File (*.json)',
            'rgx_ver' , '"version": +(\d+)\.(\d+)'
        ),
        'updater', Map(
            'url'     , 'https://raw.githubusercontent.com/GroggyOtter/ahkv2_definition_rewrite/main/definition_updater.v2.ahk',
            'filename', 'definition_updater.v2.ahk',
            'filepath', '',
            'filetype', 'AHK File (*.ahk)',
            'rgx_ver' , 'static version := (\d+)\.(\d+)'
        )
    )
    
    static running := 0
    
    static __New() => this.start()
    
    static run() {
        if !this.running
            return
        for id, data in this.file_list
            this.check_for_update(data)
        this.run_again()
    }
    
    static run_again(stop:=0) {
        callback := ObjBindMethod(this, 'run')
        if stop
            SetTimer(callback, 0)
        else SetTimer(callback, Abs(this.frequency * 3600000) * -1)
    }
    
    static check_for_update(data) {
        if !data['filepath'] || !FileExist(data['filepath'])
            if !this.get_file_location(data)
                return
        
        install_ver := this.get_version(FileRead(data['filepath']), data['rgx_ver'])
        online_txt := this.get_http(data['url'])
        online_ver := this.get_version(online_txt, data['rgx_ver'])
        
        for index, install_num in install_ver
            if (index = 0)
                continue
            else if (online_ver[index] > install_num) {
                MsgBox(data['filepath'])
                FileDelete(data['filepath'])
                FileAppend(online_txt, data['filepath'], 'UTF-8')
                this.notify_user(data['filename'] ' has been updated.'
                    '`nVS Code needs to be reloaded for changes to take effect.')
                break
            }
    }
    
    static notify_user(msg) {
        if this.notify
            TrayTip(msg)
    }
    
    static get_version(txt, rgx) {
        if RegExMatch(txt, rgx, &match)
            return match
        return [0, 0, 0]
    }  
    
    static get_file_location(data) {
        path := ''
        if (data['filename'] = 'definition_updater.v2.ahk') {
            default_path := A_ScriptDir
            loop files default_path '\*', 'FR'
                if RegExMatch(A_LoopFileFullPath, this.rgx['thqby'])
                    path := A_LoopFileFullPath
            until (path)
        }    
        else {
            default_path := A_AppData '\..\..\.vscode\extensions'
            v_list := []
            loop files default_path '\*', 'D'
                if RegExMatch(A_LoopFileFullPath, this.rgx['thqby'])
                    v_list.Push(A_LoopFileFullPath)
            
            if (v_list.Length = 0)
                path := ''
            else if (v_list.Length = 1)
                path := v_list[1]
            else 
                for value in v_list
                    path := this.get_most_recent(value, path, this.rgx['lsp_ver'])
            path .= '\syntaxes\' data['filename']
        }
        
        if !FileExist(path)
            path := ask_user(data)
        if (path = '')
            return 0
        data['filepath'] := path
        return 1
        
        ask_user(data) {
            path := ''
            filename := data['filename']
            loop
                path := FileSelect(0x1, default_path '\' filename, 'Please select the file: ' filename, data['filetype'])
            until (InStr(path, filename) && FileExist(path)) || (path = '')
            if (path = '')
                this.error(filename ' could not be found.')
            else SplitPath(path, , &last)
            return path
        }
    }
    
    static get_most_recent(v1, v2, version_rgx) {
        if !v1
            return v2
        if !v2
            return v1
        if !RegExMatch(v1, version_rgx, &match1)
            return v2
        if !RegExMatch(v2, version_rgx, &match2)
            return v1
        for index, value in match1
            if (match2[index] > value)
                return v1
            else if (match2[index] < value)
                return v2
        return v1
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
