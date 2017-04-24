package org.tjhuey.manager.service.exception;

public class ScoreTooLowException extends RuntimeException{

	private static final long serialVersionUID = 1L;

	public ScoreTooLowException(String message) {
		super(message);
	}
}
