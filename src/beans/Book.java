package beans;

public class Book {
	private String id;
	private String title, author, category;
	private int nopages;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getNopages() {
		return nopages;
	}

	public void setNopages(int nopages) {
		this.nopages = nopages;
	}

}
