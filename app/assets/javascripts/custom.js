document.addEventListener('turbolinks:load', () => {
  let showCommentsAnchors = document.querySelectorAll('.show-comments-anchor')

  showCommentsAnchors.forEach((link) => {
    link.addEventListener('click', (event) => {
      event.preventDefault()
      let id = event.target.dataset.postId
      let comments = document.querySelector(`.comments[data-post-id='${id}'`)
      comments.classList.toggle('hidden')
      if (event.target.innerText == 'Show comments') {
        event.target.innerText = 'Hide comments'
      } else {
        event.target.innerText = 'Show comments'
      }
    })
  })


})
