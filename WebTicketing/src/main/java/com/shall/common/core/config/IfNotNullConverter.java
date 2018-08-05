package com.shall.common.core.config;
import org.dozer.DozerConverter;

public class IfNotNullConverter extends DozerConverter<Object, Object> {

    public IfNotNullConverter() {
        super(Object.class, Object.class);
    }

    @Override
    public Object convertTo(Object source, Object destination) {
        return getObject(source, destination);
    }

    @Override
    public Object convertFrom(Object source, Object destination) {
        return getObject(source, destination);
    }

    private Object getObject(Object source, Object destination) {
        if (source != null) {
            return source;
        } else {
            return destination;
        }
    }

}