$ ->
    if window.山彥
        console.log '在本地演出'
        本地運行()
    else
        console.log '在瀏覽器上演出'
        在線運行()


本地運行 = ->
    window.v = new Vue
        el: '#總畫面'
        data:
            圖片文件夾: ''
            音樂文件夾: ''
            視頻文件夾: ''
            自定css: ''
            主題css: ''
            解析度: ''
            邊界: ''
            用戶設置: 
                文字速度: 35
                對話框背景透明度: 0.8
                自動收起控制面板: true
                總體音量: 1
        watch:
            $data:
                handler: (val, oldVal) ->
                    山彥.vue更新(val)
                deep: true
    山彥.vue連接初始化((x)-> 
        for a,b of x
            v[a]=b
    )
    山彥.初始化()


在線運行 = ->
    if typeof(虛擬核心) == "undefined"
        alert '無法加載虛擬核心。'
        return
        
    window.山彥 =
        n: 0
        更新: ->
            演出.改變演出狀態(虛擬核心.演出步[this.n])
        步進: ->
            this.n += 1
        步進更新: ->
            this.步進()
            this.更新()
        設置: ->
            0
        初始化: ->
            演出.準備工作()
            
    window.v = new Vue
        el: '#總畫面'
        data:
            圖片文件夾: 虛擬核心.圖片文件夾
            音樂文件夾: 虛擬核心.音樂文件夾
            視頻文件夾: 虛擬核心.視頻文件夾
            自定css: 虛擬核心.自定css
            主題css: 虛擬核心.主題css
            解析度: 虛擬核心.解析度
            邊界: 虛擬核心.邊界
            用戶設置: 
                文字速度: 35
                對話框背景透明度: 0.8
                自動收起控制面板: true
                總體音量: 1
    
    $('title').html 虛擬核心.作品名
    山彥.初始化()
