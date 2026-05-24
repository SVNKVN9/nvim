require('minuet').setup({
    provider = 'openai_fim_compatible',

    provider_options = {
        openai_fim_compatible = {
            model = 'qwen2.5-coder:7b',
            -- Ollama OpenAI-compatible FIM endpoint
            end_point = 'http://192.168.1.201:11434/v1/completions',
            -- Ollama ไม่ต้องใช้ API key — ชี้ไปที่ env var ที่มีอยู่แล้ว
            api_key = 'TERM',
            name = 'Ollama',
            stream = true,
            optional = {
                stop = nil,
                max_tokens = 256,
                temperature = 0.2,
                top_p = 0.9,
            },
        },
    },

    -- ghost text แบบ Copilot
    virtualtext = {
        auto_trigger_ft = { '*' },
        keymap = {
            -- Tab จัดการผ่าน nvim-cmp แล้ว
            accept = nil,
            -- Alt+a = accept ทีละบรรทัด
            accept_line = '<M-a>',
            -- Alt+[ / Alt+] = เปลี่ยน suggestion
            prev = '<M-[>',
            next = '<M-]>',
            -- Alt+e = dismiss
            dismiss = '<M-e>',
        },
    },

    -- delay ก่อน request (ms) ป้องกัน spam
    throttle = 1500,
    debounce = 500,

    -- timeout รอ response (วินาที)
    request_timeout = 5,

    -- จำนวน context ที่ส่งไป
    context_window = 4096,
    context_ratio = 0.6,
})
