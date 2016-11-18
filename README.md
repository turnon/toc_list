# TocList

Convert hash like this:

```ruby
hash = {'table of content' => [
  {'Platform features' => ['Scalability', 'Fault-tolerance']},
  {'Language features' => ['Functional programming', 'Extensibility and DSLs']},
  {'Tooling features' => ['A growing ecosystem', 'Interactive development', 'Erlang compatible']}]
}
```

into html list fragment like this (by default):

```html
<div class="toc_container">
    <a href="#table_of_content">table of content</a>
    <ol>
        <li>
            <a href="#Platform_features">Platform features</a>
            <ol>
                <li>
                    <a href="#Scalability">Scalability</a>
                </li>
                <li>
                    <a href="#Fault-tolerance">Fault-tolerance</a>
                </li>
            </ol>
        </li>
        <li>
            <a href="#Language_features">Language features</a>
            <ol>
                <li>
                    <a href="#Functional_programming">Functional programming</a>
                </li>
                <li>
                    <a href="#Extensibility_and_DSLs">Extensibility and DSLs</a>
                </li>
            </ol>
        </li>
        <li>
            <a href="#Tooling_features">Tooling features</a>
            <ol>
                <li>
                    <a href="#A_growing_ecosystem">A growing ecosystem</a>
                </li>
                <li>
                    <a href="#Interactive_development">Interactive development</a>
                </li>
                <li>
                    <a href="#Erlang_compatible">Erlang compatible</a>
                </li>
            </ol>
        </li>
    </ol>
</div>
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'toc_list'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install toc_list

## Usage

```ruby
TocList.new(hash).render
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

