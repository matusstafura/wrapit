local job = require('plenary.job')

describe("linkit", function()
    it('can be required', function()
        require('linkit')
    end)

    it('creates an a tag with url provided', function() 
        local text = "https://example.com"
        local got = require('linkit').href(text)
        local want = "<a href=\"https://example.com\">https://example.com</a>"
        assert.are.same(want, got)
    end)

    it('creates an image tag with url provided', function() 
        local image = "https://example.com/image.png"
        local got = require('linkit').src(image)
        local want = "<img src=\"https://example.com/image.png\" />"
        assert.are.same(want, got)
    end)

    it('creates an a tag with url and title provided', function() 
        local text = "https://example.com"
        local href = require('linkit').href
        local got = require('linkit').tag(href, text)
        local want = "<a href=\"https://example.com\">https://example.com</a>"
        assert.are.same(want, got)
    end)

    it('test get_selection', function() 
        M = {}
        local text = "Site design by https://example.com. Contact me at https://example.com/contact"
        vim.api.nvim_buf_set_lines(0, 0, -1, false, {text})

        local hmm = vim.api.nvim_command("normal! wwwvwwwwwh<cr>")
        local x, _, _ = require('linkit').get_selection()

        local want = "<a href=\"https://example.com\">https://example.com</a>"
        local got = require('linkit').href(x)
        assert.are.same(want, got)

    end)
end)
