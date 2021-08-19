const initReviewOnHover = () => {
  const cards = document.querySelectorAll('.booking-card-past');
  cards.forEach((card) => {
    const review = document.querySelector('.review')
    card.addEventListener('mouseover', () => {
      review.classList.add('review-visible');
    }); 
    card.addEventListener('mouseout', () => {
      review.classList.remove('review-visible');
    }); 
  });
}

export { initReviewOnHover };