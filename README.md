# Jekyll Bulma Tabs Plugin

This is a Jekyll tags plugin to add [bulma](https://bulma.io/) style tabs to the GitHub pages
along with the [bulma-clean-theme](https://github.com/chrisrhymes/bulma-clean-theme).

This plugin was created based on the [Jekyll Tabs](https://github.com/Ovski4/jekyll-tabs) plugin.
Like the Jekyll Tabs does, Jekyll Bulma Tabs has features:
- works with multiple tab panels on the same page
- doesn't require a specific JavaScript framework

## Installation

#### Plugin

Add the plugin in the Jekyll GitHub pages `Gemfile`.
```ruby
group :jekyll_plugins do
  # ... other gems
  gem "jekyll-bulma-tabs"
end
```

Also, add the plugin in the Jekyll Github pages `_config.yml`.
```yml
plugins:
  - jekyll-bulma-tabs
```

Run the command below to install the plugin.
```bash
bundle install
```

#### JavaScript and CSS
Copy JavaScript and CSS files to the Jekyll Github pages public directory.
In general, the places are `assets/js` and `assets/css`.
- JavaScript: [https://raw.githubusercontent.com/yokolet/jekyll-bulma-tabs/main/docs/tabs.js](https://raw.githubusercontent.com/yokolet/jekyll-bulma-tabs/main/docs/tabs.js)
- CSS: [https://raw.githubusercontent.com/yokolet/jekyll-bulma-tabs/main/docs/tabs.css](https://raw.githubusercontent.com/yokolet/jekyll-bulma-tabs/main/docs/tabs.css)

Add `tabs.js` and `tabs.css` to  GitHub pages' header/footer area. Exactly what file depends on how the GitHub pages are
created. For example, if the theme is bulma-clean-theme, the `tabs.js` goes to `_includes/footer-scripts.html` while the
`tabs.css` goes to `_includes/head.html`.

Example:
- `_includes/footer-scripts.html`
```html
<script src="{{ "/assets/js/tabs.js" | prepend: site.baseurl }}" type="text/javascript"></script>
```
- `_includes/head.html`
```html
<link rel="stylesheet" href="{{ site.baseurl }}/assets/css/tabs.css">
```

## Usage

#### Markup
The markup looks like below:

````markdown
{% tabs data-struct is-centered is-boxed %}

{% tab data-struct yaml %}
```yaml
hello:
  - 'whatsup'
  - 'hi'
```
{% endtab %}

{% tab data-struct json %}
```json
{
    "hello": ["whatsup", "hi"]
}
```
{% endtab %}

{% endtabs %}
````

#### Description
The syntax is:
```markdown
{% tabs tabs-group-id bulma-tabs-options %}
{% tab tabs-group-id tab-title-1 %}
contents1
{% endtab %}
{% tab tabs-group-id tab-title-2 %}
contents2
{% endtab %}
{% endtabs %}
```

- tabs-group-id: (mandate) The id of tabs group and used to switch contents.
- bulma-tabs-options: (optional) Among the bulma tabs styling options, those used with tabs class are supported such as `is-centered` or `is-boxed`.
- tab-title: (mandate) The title appears in the tab.
- contents: (mandate) The contents tied to the tab title.

#### Usage Example

- code: [code-example](https://raw.githubusercontent.com/idealapt404/idealapt404.github.io-code/main/algo/others/2022-11-07-maximum-69-number.md)
- working tabs: [site](https://idealapt404.github.io/algo/others/2022-11-07-maximum-69-number)

## License

The theme is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).