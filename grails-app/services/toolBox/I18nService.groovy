package toolBox

import grails.gorm.transactions.Transactional
import org.springframework.context.MessageSource
import org.springframework.web.servlet.i18n.SessionLocaleResolver

/**
 * Date/檔案建立日期: 2020-02-07
 *Time/檔案建立時間: 09:31
 * File Description/檔案描述:多國語系
 * @author JamesChang
 * @since Grails4.0.1
 */
@Transactional
class I18nService {

    boolean transactional = false
    SessionLocaleResolver localeResolver
    MessageSource messageSource

    /**
     *
     * @param msgKey
     * @param defaultMessage default message to use if none is defined in the message source
     * @param objs objects for use in the message
     * @return
     */
    def msg(String msgKey, String defaultMessage = null, List objs = null) {

        def msg = messageSource.getMessage(msgKey,objs?.toArray(),defaultMessage,localeResolver.defaultLocale)

        if (msg == null || msg == defaultMessage) {
            log.warn("No i18n messages specified for msgKey: ${msgKey}")
            msg = defaultMessage
        }

        return msg
    }

    /**
     * Method to look like g.message
     * @param args
     * @return
     */
    def message(Map args) {
        def attrs = (args.attrs?:args.args)
        return msg(args.code, args.default, attrs)
    }
}
