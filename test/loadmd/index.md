# `loadmd` tests

## OK

All following links should be rendered correctly :

- [test-1](test-1)
- [test-1/](test-1/)
- FIXME: [test-2](test-2)
- FIXME: [test-2.html](test-2.html)
- FIXME: [test-2/](test-2/)

## KO

All following links should produced an error :

- [test-1.html](test-1.html)
- [test-3.html](test-3.html)
- FIXME: [test-3](test-3)
- [test-3/](test-3/)
