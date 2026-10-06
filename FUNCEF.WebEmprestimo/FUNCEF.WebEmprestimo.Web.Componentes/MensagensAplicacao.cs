using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FUNCEF.Planus.WebEmprestimo.Web.Componentes
{
    /// <summary>
    /// Contém as todas mensagens padrões do sistema.
    /// </summary>
    public sealed class MensagensAplicacao
    {
        private MensagensAplicacao()
        {
        }

        /// <summary>
        /// Obtém a instância da classe.
        /// </summary>
        public static MensagensAplicacao instancia = new MensagensAplicacao();

        /// <summary>
        /// "Os dados alterados não foram salvos. Deseja realmente continuar?"
        /// </summary>
        public string mensagem001 = "Os dados alterados não foram salvos. Deseja realmente continuar?";

        /// <summary>
        /// "Erro de sistema. Contate o suporte."
        /// </summary>
        public string mensagem002 = "Erro de sistema. Contate o suporte.";

        /// <summary>
        /// "Campo de preenchimento obrigatório."
        /// </summary>
        public string mensagem003 = "Campo de preenchimento obrigatório.";

        /// <summary>
        /// "Cadastro realizado com sucesso."
        /// </summary>
        public string mensagem004 = "Cadastro realizado com sucesso.";

        /// <summary>
        /// "Registro alterado com sucesso."
        /// </summary>
        public string mensagem005 = "Registro alterado com sucesso.";

        /// <summary>
        /// "Confirma exclusão de registro? Esta operação não poderá ser desfeita."
        /// </summary>
        public string mensagem006 = "Confirma exclusão de registro? Esta operação não poderá ser desfeita.";

        /// <summary>
        /// "Nenhum registro encontrado."
        /// </summary>
        public string mensagem007 = "Nenhum registro encontrado.";

        /// <summary>
        /// "Exclusão realizada com sucesso."
        /// </summary>
        public string mensagem008 = "Exclusão realizada com sucesso.";

        /// <summary>
        /// "Usuário não cadastrado na rede da FUNCEF."
        /// </summary>
        public string mensagem009 = "Usuário não cadastrado na rede da FUNCEF.";

        /// <summary>
        /// "Data final inválida. Favor informar uma data final maior que a data inicial."
        /// </summary>
        public string mensagem010 = "Data final inválida. Favor informar uma data final maior que a data inicial.";

        /// <summary>
        /// "Login ou senha de usuário não confere."
        /// </summary>
        public string mensagem011 = "Login ou senha de usuário não confere.";

        /// <summary>
        /// "Usuário impossibilitado de acessar o sistema."
        /// </summary>
        public string mensagem012 = "Usuário impossibilitado de acessar o sistema.";

        /// <summary>
        /// "Deseja realmente cadastrar um novo registro?"
        /// </summary>
        public string mensagem013 = "Deseja realmente cadastrar um novo registro?";

        /// <summary>
        /// "Usuário não possui acesso a esta funcionalidade."
        /// </summary>
        public string mensagem014 = "Usuário não possui acesso a esta funcionalidade.";

        /// <summary>
        /// "Digitar no mínimo 3 caracteres."
        /// </summary>
        public string mensagem015 = "Digitar no mínimo 3 caracteres.";

        /// <summary>
        /// Associações salvas com sucesso.
        /// </summary>
        public string mensagem016 = "Associações salvas com sucesso.";

        /// <summary>
        /// Confirma exclusão de registro em massa? Esta operação não poderá ser desfeita.
        /// </summary>
        public string mensagem017 = "Confirma exclusão de registro em massa? Esta operação não poderá ser desfeita.";

        /// <summary>
        /// "Selecione um registro."
        /// </summary>
        public string mensagem018 = "Selecione um registro.";

        /// <summary>
        /// "Selecione apenas um registro."
        /// </summary>
        public string mensagem019 = "Selecione apenas um registro.";

        /// <summary>
        /// "Selecione ao menos um registro."
        /// </summary>
        public string mensagem020 = "Selecione ao menos um registro.";

        /// <summary>
        /// "E-mail não encontrado para o usuário cadastrado na rede da FUNCEF. Contate o suporte."
        /// </summary>
        public string mensagem023 = "E-mail não encontrado para o usuário cadastrado na rede da FUNCEF. Contate o suporte.";

        /// <summary>
        /// "Um ou mais campos obrigatórios não preenchidos."
        /// </summary>
        public string mensagem024 = "Um ou mais campos obrigatórios não preenchidos.";

        /// <summary>
        /// "Um ou mais campos vazios ou não preenchidos corretamente."
        /// </summary>
        public string mensagem025 = "Um ou mais campos vazios ou não preenchidos corretamente.";

        /// <summary>
        /// "Selecione um campo e informe o valor para alteração."
        /// </summary>
        public string mensagem026 = "Selecione um campo e informe o valor para alteração.";

        /// <summary>
        /// "Um ou mais campos obrigatórios não preenchidos ou inválidos."
        /// </summary>
        public string mensagem027 = "Um ou mais campos obrigatórios não preenchidos ou inválidos.";

        /// <summary>
        /// "O CPF informado é inválido."
        /// </summary>
        public string mensagem028 = "O CPF informado é inválido.";

        /// <summary>
        /// "O contrato não pode ser refinanciado."
        /// </summary>
        public string mensagem029 = "O contrato não pode ser refinanciado.";

        /// <summary>
        /// "Não foi informado nenhum valor e o saldo devedor será refinanciado."
        /// </summary>
        public string mensagem030 = "Não foi informado nenhum valor.\\rDessa forma o saldo devedor será refinanciado.\\rDeseja Prosseguir?";

        /// <summary>
        /// "Amortização incluída com sucesso."
        /// </summary>
        public string mensagem031 = "Amortização incluída com sucesso";

        /// <summary>
        /// "Quitação incluída com sucesso."
        /// </summary>
        public string mensagem032 = "Quitação incluída com sucesso";

        /// <summary>
        /// "O status dessa suspensão não permite alteração."
        /// </summary>
        public string mensagem033 = "O status dessa suspensão não permite alteração.";

        /// <summary>
        /// "Existe uma suspensão ativa para esse contrato."
        /// </summary>
        public string mensagem034 = "Existe uma suspensão ativa para esse contrato.";

        /// <summary>
        /// "Suspensão não permitida, existem itens em aberto."
        /// </summary>
        public string mensagem035 = "Suspensão não permitida, existem itens em aberto.";

        /// <summary>
        /// "Data de Liberação não pode ser menor que a Data do Início da Suspensão."
        /// </summary>
        public string mensagem036 = "Data de Liberação não pode ser menor que a Data do Início da Suspensão.";

        /// <summary>
        /// "Para encerramento a Data de Liberação não deve ser informada."
        /// </summary>
        public string mensagem037 = "Para encerramento a Data de Liberação não deve ser informada.";

        /// <summary>
        /// "Data de Liberação informada, status deve ser Cancelada."
        /// </summary>
        public string mensagem038 = "Data de Liberação informada, status deve ser Cancelada.";

        /// <summary>
        /// "Data Início não pode ser maior que Data Final."
        /// </summary>
        public string mensagem039 = "Data Início não pode ser maior que Data Final.";

        /// <summary>
        /// "Não existe conta bancária associada a este contrato."
        /// </summary>
        public string mensagem040 = "Não existe conta bancária associada a este contrato.";

        //MARCIO SANCHES SPINOSA SOL 209315 KINTANA 2022203 - INICIO
        /// <summary>
        /// "A prestação do mês já foi gerada. O valor da prestação será afetado no mês seguinte."
        /// </summary>
        public string mensagem041 = "Atenção: A prestação do mês já foi gerada. O valor da prestação será afetado no mês seguinte.";
        //MARCIO SANCHES SPINOSA SOL 209315 KINTANA 2022203 - FIM

        //William Moreira da Silva SOL 211419
        /// <summary>
        /// "A alteração do prazo contratual somente será permitida após a baixa da parcela do mês."
        /// </summary>
        public string mensagem042 = "A alteração do prazo contratual somente será permitida após a baixa da parcela do mês.";
        //William Moreira da Silva SOL 211419

        //William Moreira da Silva SOL 238689
        /// <summary>
        /// "A alteração do prazo contratual somente será permitida após a baixa da parcela do mês."
        /// </summary>
        public string mensagem043 = "O processo não poderá ser executado. O usuário é o próprio mutuário do contrato de empréstimo!";
        //William Moreira da Silva SOL 238689
    }
}