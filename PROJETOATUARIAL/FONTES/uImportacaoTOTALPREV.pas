{===============================================================================
Unit    :  uImportacaoTOTALPREV
Form    :

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 12/09/2000

Objetivo: Procedimentos referentes à importação das Tabelas Auxiliares -
          "padrão CM" para as tabelas do Projeto Atuarial.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit uImportacaoTOTALPREV;

interface

uses uFuncGerais, Classes, Dialogs, dBaseDados;

var
    falhou, cancelado: Boolean; // Flag para verificar falha antes do COMMIT

    procedure InserePessoaJuridica(Entid, Patroc, Plano: Integer;
                                   Tabela_Auxiliar: Boolean);
    procedure InsereParticipante(Entid, Versao: Integer; situacao,
         patrocinadoras, planos: String;Dt_Refer_Base: TDateTime);
    procedure InsereBeneficiario(Patroc, Plano, Partic, Versao: Integer);
    procedure InsereDependente(Patroc, Plano, Partic, Benef, Versao: Integer);
    procedure InsereDependenteAtivo(Patroc, Plano, Partic, Versao: integer);
    procedure InsereTaxaContribPartic(Patroc, Plano, Versao, Partic: Integer);
    procedure InsereTipoValor(Versao, Partic, Cod: Integer; Valor: Real);

var
  w_linhas, w_linha_atual : word;
  qtempo : tlist;
  rtempo: TTempo;
  tempo_serv_anterior, tempo_nao_creditado, tempo_servico: integer;


implementation

uses uDtmImportacao, FAnimacao, Forms, comctrls, SysUtils, uglobal;

//-----------------------------------------------------------------------------
//     Importar os dados de Pessoa Juridica, Patrocinadora, ...
//     das "Tabelas CM" para as Tabelas do Projeto Atuarial
//-----------------------------------------------------------------------------
procedure InserePessoaJuridica(Entid, Patroc, Plano: Integer; Tabela_Auxiliar: Boolean);

begin
  Application.CreateForm(TfrmAnimacao, frmAnimacao);
  w_linhas := 10; //Número de linhas (registros) do arquivo
  w_linha_Atual := 0;
  frmAnimacao.SetAnimacao('Importando TOTALPREV - Tabelas Auxiliares ...',
                           w_linhas,True,True,aviCopyFiles);
  falhou := false;
  cancelado := false;

     w_linha_atual := w_linha_atual + 1;
     frmAnimacao.SetProgressBar(w_linha_atual);
     if frmAnimacao.Cancel Then
      Begin
        cancelado := true;
        frmAnimacao.Close;
        frmAnimacao.Free;
        ShowMessage('Processamento cancelado por intervenção do usuário');
        Exit;
      End;

  //-- PESSOA

  with dtmImportacao do
   begin
    try
     qryInsPessoa.ExecSQL;
     w_linha_atual := w_linha_atual + 1;
     frmAnimacao.SetProgressBar(w_linha_atual);
     if frmAnimacao.Cancel Then
      Begin
        cancelado := true;
        frmAnimacao.Close;
        frmAnimacao.Free;
        ShowMessage('Processamento cancelado por intervenção do usuário');
        Exit;
      End;
    except
     falhou := true;
     exit;
    end;

    //-- PESSOA PATROCINADORA

    try

     qryInsPatroc.ParamByName('DT_REAJUSTE_SALARIO').asDateTime := Date;
     qryInsPatroc.ExecSQL;
   //-- PLANO
     if not(Tabela_Auxiliar) then
      begin
       qryInsPlano.ParamByName('CD_PESSOA_PATROC').asInteger := Patroc;
       qryInsPlano.ParamByName('CD_PESSOA_ENTID').asInteger := Entid;
       qryInsPlano.ExecSQL;
      end
     else
      begin
       qryPatroc.Open;

       repeat
        qryInsPlano.ParamByName('CD_PESSOA_PATROC').asInteger :=
                                    qryPatroc.FieldByName('IDPESSOA').asInteger;
        qryInsPlano.ParamByName('CD_PESSOA_ENTID').asInteger := Entid;
        qryInsPlano.ExecSQL;
        qryPatroc.Next;
       until qryPatroc.EOF;

       qryPatroc.Close;
      end; //else

     w_linha_atual := w_linha_atual + 1;
     frmAnimacao.SetProgressBar(w_linha_atual);
     if frmAnimacao.Cancel Then
      Begin
        cancelado := true;
        frmAnimacao.Close;
        frmAnimacao.Free;
        ShowMessage('Processamento cancelado por intervenção do usuário');
        Exit;
      End;

     qryInsDependencia.ExecSQL;
     qryInsSitFundacao.ExecSQL;
     qryInsSitPatroc.ExecSQL;
     qryInsDuracao.ExecSQL;

     w_linha_atual := w_linha_atual + 1;
     frmAnimacao.SetProgressBar(w_linha_atual);
     if frmAnimacao.Cancel Then
      Begin
        cancelado := true;
        frmAnimacao.Close;
        frmAnimacao.Free;
        ShowMessage('Processamento cancelado por intervenção do usuário');
        Exit;
      End;

     try
      qryInsTipoTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 1;
      qryInsTipoTempo.ParamByName('DS_TIPO_TEMPO').asString := 'Data Inscricao';
      qryInsTipoTempo.ParamByName('IR_DOMINIO_SISTEMA').asString := 'INS';
      qryInsTipoTempo.ExecSQL;
     except
      qryUpdTipoTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 1;
      qryUpdTipoTempo.ParamByName('DS_TIPO_TEMPO').asString := 'Data Inscricao';
      qryUpdTipoTempo.ParamByName('IR_DOMINIO_SISTEMA').asString := 'INS';
      qryUpdTipoTempo.ExecSQL;
     end;
      try
       qryInsTipoTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 2;
       qryInsTipoTempo.ParamByName('DS_TIPO_TEMPO').asString := 'Data Nascimento';
       qryInsTipoTempo.ParamByName('IR_DOMINIO_SISTEMA').asString := 'NAS';
       qryInsTipoTempo.ExecSQL;
      except
       qryUpdTipoTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 2;
       qryUpdTipoTempo.ParamByName('DS_TIPO_TEMPO').asString := 'Data Nascimento';
       qryUpdTipoTempo.ParamByName('IR_DOMINIO_SISTEMA').asString := 'NAS';
       qryUpdTipoTempo.ExecSQL;
      end;
     try
      qryInsTipoTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 3;
      qryInsTipoTempo.ParamByName('DS_TIPO_TEMPO').asString := 'Data de Admissao';
      qryInsTipoTempo.ParamByName('IR_DOMINIO_SISTEMA').asString := 'ADM';
      qryInsTipoTempo.ExecSQL;
     except
      qryUpdTipoTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 3;
      qryUpdTipoTempo.ParamByName('DS_TIPO_TEMPO').asString := 'Data de Admissao';
      qryUpdTipoTempo.ParamByName('IR_DOMINIO_SISTEMA').asString := 'ADM';
      qryUpdTipoTempo.ExecSQL;
     end;
      try
       qryInsTipoTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 4;
       qryInsTipoTempo.ParamByName('DS_TIPO_TEMPO').asString := 'Data de Início de Beneficio';
       qryInsTipoTempo.ParamByName('IR_DOMINIO_SISTEMA').asString := 'DIB';
       qryInsTipoTempo.ExecSQL;
      except
       qryUpdTipoTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 4;
       qryUpdTipoTempo.ParamByName('DS_TIPO_TEMPO').asString := 'Data de Início de Beneficio';
       qryUpdTipoTempo.ParamByName('IR_DOMINIO_SISTEMA').asString := 'DIB';
       qryUpdTipoTempo.ExecSQL;
      end;
     try
      qryInsTipoTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 5;
      qryInsTipoTempo.ParamByName('DS_TIPO_TEMPO').asString := 'Tempo de Serviço Anterior';
      qryInsTipoTempo.ParamByName('IR_DOMINIO_SISTEMA').asString := 'ANT';
      qryInsTipoTempo.ExecSQL;
     except
      qryUpdTipoTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 5;
      qryUpdTipoTempo.ParamByName('DS_TIPO_TEMPO').asString := 'Tempo de Serviço Anterior';
      qryUpdTipoTempo.ParamByName('IR_DOMINIO_SISTEMA').asString := 'ANT';
      qryUpdTipoTempo.ExecSQL;
     end;
      try
       qryInsTipoTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 6;
       qryInsTipoTempo.ParamByName('DS_TIPO_TEMPO').asString := 'Tempo de Serviço';
       qryInsTipoTempo.ParamByName('IR_DOMINIO_SISTEMA').asString := 'TPS';
       qryInsTipoTempo.ExecSQL;
      except
       qryUpdTipoTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 6;
       qryUpdTipoTempo.ParamByName('DS_TIPO_TEMPO').asString := 'Tempo de Serviço';
       qryUpdTipoTempo.ParamByName('IR_DOMINIO_SISTEMA').asString := 'TPS';
       qryUpdTipoTempo.ExecSQL;
      end;
     try
      qryInsTipoTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 7;
      qryInsTipoTempo.ParamByName('DS_TIPO_TEMPO').asString := 'Último Salário de Participação';
      qryInsTipoTempo.ParamByName('IR_DOMINIO_SISTEMA').asString := 'USP';
      qryInsTipoTempo.ExecSQL;
     except
      qryUpdTipoTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 7;
      qryUpdTipoTempo.ParamByName('DS_TIPO_TEMPO').asString := 'Último Salário de Participação';
      qryUpdTipoTempo.ParamByName('IR_DOMINIO_SISTEMA').asString := 'USP';
      qryUpdTipoTempo.ExecSQL;
     end;
      try
       qryInsTipoTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 8;
       qryInsTipoTempo.ParamByName('DS_TIPO_TEMPO').asString := 'Data da Situacao na Fundacao';
       qryInsTipoTempo.ParamByName('IR_DOMINIO_SISTEMA').asString := 'STF';
       qryInsTipoTempo.ExecSQL;
      except
       qryUpdTipoTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 8;
       qryUpdTipoTempo.ParamByName('DS_TIPO_TEMPO').asString := 'Data da Situacao na Fundacao';
       qryUpdTipoTempo.ParamByName('IR_DOMINIO_SISTEMA').asString := 'STF';
       qryUpdTipoTempo.ExecSQL;
      end;
     try
      qryInsTipoTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 9;
      qryInsTipoTempo.ParamByName('DS_TIPO_TEMPO').asString := 'Data da Situacao na Patrocinadora';
      qryInsTipoTempo.ParamByName('IR_DOMINIO_SISTEMA').asString := 'STP';
      qryInsTipoTempo.ExecSQL;
     except
      qryUpdTipoTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 9;
      qryUpdTipoTempo.ParamByName('DS_TIPO_TEMPO').asString := 'Data da Situacao na Patrocinadora';
      qryUpdTipoTempo.ParamByName('IR_DOMINIO_SISTEMA').asString := 'STP';
      qryUpdTipoTempo.ExecSQL;
     end;

     w_linha_atual := w_linha_atual + 1;
     frmAnimacao.SetProgressBar(w_linha_atual);
     if frmAnimacao.Cancel Then
      Begin
        cancelado := true;
        frmAnimacao.Close;
        frmAnimacao.Free;
        ShowMessage('Processamento cancelado por intervenção do usuário');
        Exit;
      End;


      try
       qryInsTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 1;
       qryInsTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Ultimo Salario de Participacao';
       qryInsTipoValor.ExecSQL;
      except
       qryUpdTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 1;
       qryUpdTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Ultimo Salario de Participacao';
       qryUpdTipoValor.ExecSQL;
      end;
       try
        qryInsTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 2;
        qryInsTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Valor do Beneficio';
        qryInsTipoValor.ExecSQL;
       except
        qryUpdTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 2;
        qryUpdTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Valor do Beneficio';
        qryUpdTipoValor.ExecSQL;
       end;
      try
       qryInsTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 3;
       qryInsTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Percentual de Contribuicao';
       qryInsTipoValor.ExecSQL;
      except
       qryUpdTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 3;
       qryUpdTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Percentual de Contribuicao';
       qryUpdTipoValor.ExecSQL;
      end;
     try
      qryInsTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 4;
      qryInsTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Saldo de Contribuicao';
      qryInsTipoValor.ExecSQL;
     except
      qryUpdTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 4;
      qryUpdTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Saldo de Contribuicao';
      qryUpdTipoValor.ExecSQL;
     end;
      try
       qryInsTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 5;
       qryInsTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Salario Medio de Contribuicao';
       qryInsTipoValor.ExecSQL;
      except
       qryUpdTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 5;
       qryUpdTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Salario Medio de Contribuicao';
       qryUpdTipoValor.ExecSQL;
      end;
     try
      qryInsTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 6;
      qryInsTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Saldo de Contribuicao de Participante';
      qryInsTipoValor.ExecSQL;
     except
      qryUpdTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 6;
      qryUpdTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Saldo de Contribuicao de Participante';
      qryUpdTipoValor.ExecSQL;
     end;
      try
       qryInsTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 7;
       qryInsTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Saldo de Contribuicao de Patrocinadora';
       qryInsTipoValor.ExecSQL;
      except
       qryUpdTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 7;
       qryUpdTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Saldo de Contribuicao de Patrocinadora';
       qryUpdTipoValor.ExecSQL;
      end;
     try
      qryInsTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 8;
      qryInsTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Saldo de Transferencia de Participante';
      qryInsTipoValor.ExecSQL;
     except
      qryUpdTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 8;
      qryUpdTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Saldo de Transferencia de Participante';
      qryUpdTipoValor.ExecSQL;
     end;
      try
       qryInsTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 9;
       qryInsTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Saldo de Transferencia de Patrocinadora';
       qryInsTipoValor.ExecSQL;
      except
       qryUpdTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 9;
       qryUpdTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Saldo de Transferencia de Patrocinadora';
       qryUpdTipoValor.ExecSQL;
      end;
     try
      qryInsTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 10;
      qryInsTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Garantia';
      qryInsTipoValor.ExecSQL;
     except
      qryUpdTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 10;
      qryUpdTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Garantia';
      qryUpdTipoValor.ExecSQL;
     end;
     try
      qryInsTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 11;
      qryInsTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Valor do Beneficio - Abono';
      qryInsTipoValor.ExecSQL;
     except
      qryUpdTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 11;
      qryUpdTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Valor do Beneficio - Abono';
      qryUpdTipoValor.ExecSQL;
     end;
     try
      qryInsTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 12;
      qryInsTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Valor do Beneficio - INSS';
      qryInsTipoValor.ExecSQL;
     except
      qryUpdTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 12;
      qryUpdTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Valor do Beneficio - INSS';
      qryUpdTipoValor.ExecSQL;
     end;
     //Valores de Contribuicao
     try
      qryInsTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 13;
      qryInsTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Valor de Contribuicao Suplementar';
      qryInsTipoValor.ExecSQL;
     except
      qryUpdTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 13;
      qryUpdTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Valor de Contribuicao Suplementar';
      qryUpdTipoValor.ExecSQL;
     end;
     try
      qryInsTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 14;
      qryInsTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Taxa de Joia';
      qryInsTipoValor.ExecSQL;
     except
      qryUpdTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 14;
      qryUpdTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Taxa de Joia';
      qryUpdTipoValor.ExecSQL;
     end;
     try
      qryInsTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 16;
      qryInsTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Valor Contribuição Assistido';
      qryInsTipoValor.ExecSQL;
     except
      qryUpdTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 16;
      qryUpdTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Valor Contribuição Assistido';
      qryUpdTipoValor.ExecSQL;
     end;
     try
      qryInsTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 17;
      qryInsTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Taxa de Contribuicao Basica';
      qryInsTipoValor.ExecSQL;
     except
      qryUpdTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 17;
      qryUpdTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Taxa de Contribuicao Basica';
      qryUpdTipoValor.ExecSQL;
     end;
     try
      qryInsTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 18;
      qryInsTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Taxa de Contribuicao Normal';
      qryInsTipoValor.ExecSQL;
     except
      qryUpdTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 18;
      qryUpdTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Taxa de Contribuicao Normal';
      qryUpdTipoValor.ExecSQL;
     end;
     try
      qryInsTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 19;
      qryInsTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Taxa de Contribuicao Voluntaria';
      qryInsTipoValor.ExecSQL;
     except
      qryUpdTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 19;
      qryUpdTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Taxa de Contribuicao Voluntaria';
      qryUpdTipoValor.ExecSQL;
     end;
     try
      qryInsTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 20;
      qryInsTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Quantidade de Cotas do Beneficio';
      qryInsTipoValor.ExecSQL;
     except
      qryUpdTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 20;
      qryUpdTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Quantidade de Cotas do Beneficio';
      qryUpdTipoValor.ExecSQL;
     end;
     try
      qryInsTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 21;
      qryInsTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Percentual de Resgate da Aposentadoria';
      qryInsTipoValor.ExecSQL;
     except
      qryUpdTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 21;
      qryUpdTipoValor.ParamByName('DS_TIPO_VALOR').asString := 'Percentual de Resgate da Aposentadoria';
      qryUpdTipoValor.ExecSQL;
     end;

     w_linha_atual := w_linha_atual + 1;
     frmAnimacao.SetProgressBar(w_linha_atual);
     if frmAnimacao.Cancel Then
      Begin
        cancelado := true;
        frmAnimacao.Close;
        frmAnimacao.Free;
        ShowMessage('Processamento cancelado por intervenção do usuário');
        Exit;
      End;

     try
      qryInsEstadoCivil.ParamByName('CD_ESTADO_CIVIL').asString := 'C';
      qryInsEstadoCivil.ParamByName('DS_ESTADO_CIVIL').asString := 'Casado(a)';
      qryInsEstadoCivil.ExecSQL;
     except
      qryUpdEstadoCivil.ParamByName('CD_ESTADO_CIVIL').asString := 'C';
      qryUpdEstadoCivil.ParamByName('DS_ESTADO_CIVIL').asString := 'Casado(a)';
      qryUpdEstadoCivil.ExecSQL;
     end;
      try
       qryInsEstadoCivil.ParamByName('CD_ESTADO_CIVIL').asString := 'D';
       qryInsEstadoCivil.ParamByName('DS_ESTADO_CIVIL').asString := 'Divorciado(a)';
       qryInsEstadoCivil.ExecSQL;
      except
       qryUpdEstadoCivil.ParamByName('CD_ESTADO_CIVIL').asString := 'D';
       qryUpdEstadoCivil.ParamByName('DS_ESTADO_CIVIL').asString := 'Divorciado(a)';
       qryUpdEstadoCivil.ExecSQL;
      end;
     try
      qryInsEstadoCivil.ParamByName('CD_ESTADO_CIVIL').asString := 'S';
      qryInsEstadoCivil.ParamByName('DS_ESTADO_CIVIL').asString := 'Solteiro(a)';
      qryInsEstadoCivil.ExecSQL;
     except
      qryUpdEstadoCivil.ParamByName('CD_ESTADO_CIVIL').asString := 'S';
      qryUpdEstadoCivil.ParamByName('DS_ESTADO_CIVIL').asString := 'Solteiro(a)';
      qryUpdEstadoCivil.ExecSQL;
     end;
      try
       qryInsEstadoCivil.ParamByName('CD_ESTADO_CIVIL').asString := 'V';
       qryInsEstadoCivil.ParamByName('DS_ESTADO_CIVIL').asString := 'Viuvo(a)';
       qryInsEstadoCivil.ExecSQL;
      except
       qryUpdEstadoCivil.ParamByName('CD_ESTADO_CIVIL').asString := 'V';
       qryUpdEstadoCivil.ParamByName('DS_ESTADO_CIVIL').asString := 'Viuvo(a)';
       qryUpdEstadoCivil.ExecSQL;
      end;
     try
      qryInsEstadoCivil.ParamByName('CD_ESTADO_CIVIL').asString := 'E';
      qryInsEstadoCivil.ParamByName('DS_ESTADO_CIVIL').asString := 'Desquitado(a)';
      qryInsEstadoCivil.ExecSQL;
     except
      qryUpdEstadoCivil.ParamByName('CD_ESTADO_CIVIL').asString := 'E';
      qryUpdEstadoCivil.ParamByName('DS_ESTADO_CIVIL').asString := 'Desquitado(a)';
      qryUpdEstadoCivil.ExecSQL;
     end;
      try
       qryInsEstadoCivil.ParamByName('CD_ESTADO_CIVIL').asString := 'J';
       qryInsEstadoCivil.ParamByName('DS_ESTADO_CIVIL').asString := 'Separado(a) Judicial';
       qryInsEstadoCivil.ExecSQL;
      except
       qryUpdEstadoCivil.ParamByName('CD_ESTADO_CIVIL').asString := 'J';
       qryUpdEstadoCivil.ParamByName('DS_ESTADO_CIVIL').asString := 'Separado(a) Judicial';
       qryUpdEstadoCivil.ExecSQL;
      end;
     try
      qryInsEstadoCivil.ParamByName('CD_ESTADO_CIVIL').asString := 'M';
      qryInsEstadoCivil.ParamByName('DS_ESTADO_CIVIL').asString := 'Marital';
      qryInsEstadoCivil.ExecSQL;
     except
      qryUpdEstadoCivil.ParamByName('CD_ESTADO_CIVIL').asString := 'M';
      qryUpdEstadoCivil.ParamByName('DS_ESTADO_CIVIL').asString := 'Marital';
      qryUpdEstadoCivil.ExecSQL;
     end;
      try
       qryInsEstadoCivil.ParamByName('CD_ESTADO_CIVIL').asString := 'O';
       qryInsEstadoCivil.ParamByName('DS_ESTADO_CIVIL').asString := 'Outros';
       qryInsEstadoCivil.ExecSQL;
      except
       qryUpdEstadoCivil.ParamByName('CD_ESTADO_CIVIL').asString := 'O';
       qryUpdEstadoCivil.ParamByName('DS_ESTADO_CIVIL').asString := 'Outros';
       qryUpdEstadoCivil.ExecSQL;
      end;

     w_linha_atual := w_linha_atual + 1;
     frmAnimacao.SetProgressBar(w_linha_atual);
     if frmAnimacao.Cancel Then
      Begin
        cancelado := true;
        frmAnimacao.Close;
        frmAnimacao.Free;
        ShowMessage('Processamento cancelado por intervenção do usuário');
        Exit;
      End;

     qryInsTipoBeneficio.ExecSQL;

     w_linha_atual := w_linha_atual + 1;
     frmAnimacao.SetProgressBar(w_linha_atual);
     if frmAnimacao.Cancel Then
      Begin
        cancelado := true;
        frmAnimacao.Close;
        frmAnimacao.Free;
        ShowMessage('Processamento cancelado por intervenção do usuário');
        Exit;
      End;

     if not(Tabela_Auxiliar) then
      begin
       qryInsPlanoBeneficio.ParamByName('CD_PESSOA_PATROC').asInteger := Patroc;
       qryInsPlanoBeneficio.ParamByName('CD_PESSOA_ENTID').asInteger := Entid;
       qryInsPlanoBeneficio.ParamByName('CD_PLANO').asInteger := Plano;
       qryInsPlanoBeneficio.ExecSQL;
      end
     else
      begin
       qryPatroc.Open;
       qryPlano.Open;

       repeat
         repeat
          qryInsPlanoBeneficio.ParamByName('CD_PESSOA_ENTID').asInteger := Entid;
          qryInsPlanoBeneficio.ParamByName('CD_PESSOA_PATROC').asInteger :=
                                  qryPatroc.FieldByName('IDPESSOA').asInteger;
          qryInsPlanoBeneficio.ParamByName('CD_PLANO').asInteger :=
                                  qryPlano.FieldByName('IDPLANOPREV').asInteger;
          qryInsPlanoBeneficio.ExecSQL;
          qryPlano.Next;
         until qryPlano.EOF;

        qryPatroc.Next;
        qryPlano.first;

       until qryPatroc.EOF;

       qryPatroc.Close;
       qryPlano.Close;
      end; //else

     w_linha_atual := w_linha_atual + 1;
     frmAnimacao.SetProgressBar(w_linha_atual);
     if frmAnimacao.Cancel Then
      Begin
        cancelado := true;
        frmAnimacao.Close;
        frmAnimacao.Free;
        ShowMessage('Processamento cancelado por intervenção do usuário');
        Exit;
      End;
    except
     falhou := true;
     exit;
    end;
   end;//with DtmImportacao

     w_linha_atual := w_linha_atual + 1;
     frmAnimacao.SetProgressBar(w_linha_atual);
     if frmAnimacao.Cancel Then
      Begin
        cancelado := true;
        frmAnimacao.Close;
        frmAnimacao.Free;
        ShowMessage('Processamento cancelado por intervenção do usuário');
        Exit;
      End;

   frmAnimacao.Close;
   frmAnimacao.Free;
end;

//---------------------------------------------------------------------------
//     Importar os dados dos Participantes, Dependentes ...
//---------------------------------------------------------------------------
procedure InsereParticipante(Entid, Versao: Integer; situacao,
     patrocinadoras, planos: String;Dt_Refer_Base: TDateTime);
var
  id, tp, a: integer;
  aux_data: String;
begin
  falhou := false;
  cancelado := false;


  with dtmImportacao do
   begin
    qryParticipante.Close;
    qryParticipante.sql[66] := ' and  PARTPREVPLAN.IDPESSJUR   in (' + patrocinadoras + ') ';
    qryParticipante.sql[67] := ' and  PARTPREVPLAN.IDPLANOPREV in (' + planos + ') ';
    qryParticipante.sql[68] := ' and   PARTPREVPLAN.IDSITPART in (' + situacao + ') ';

    qryParticipante.Open;

    if qryParticipante.isEmpty then
     begin
       MessageDlg('Não foi encontrado nenhum participante.', mtWarning, [mbOk], 0);
       cancelado := true;
       exit;
     end;

    w_linhas := qryParticipante.RecordCount;//Número de linhas (registros) do arquivo

    Application.CreateForm(TfrmAnimacao, frmAnimacao);

    //-- cria variáveis para claculo do tempo
    qtempo := tlist.create;
    qtempo.capacity := 1;
    qtempo.add(ttempo.create);

    uFuncGerais.rtempo.criatempo;

    w_linha_Atual := 0;
    frmAnimacao.SetAnimacao('Importando base TOTALPREV...',
                           w_linhas,True,True,aviCopyFiles);

    while not qryParticipante.eof do
     begin
      if w_linha_atual <=  w_linhas then
        w_linha_atual := w_linha_atual + 1
      else
        exit;

      frmAnimacao.SetProgressBar(w_linha_atual);

      Try
        // -- Insere Participante
        qryInsParticipante.ParamByName('CD_VERSAO').asInteger := Versao;
        qryInsParticipante.ParamByName('cpf').asstring :=
           qryParticipante.FieldByName('cpf').asstring;

        if qryParticipante.FieldByName('estado_civil').isNull then
          qryInsParticipante.ParamByName('estado_civil').Clear
        else
          qryInsParticipante.ParamByName('estado_civil').asstring :=
             qryParticipante.FieldByName('estado_civil').asstring;

        qryInsParticipante.ParamByName('idtitular').asinteger :=
            qryParticipante.FieldByName('idtitular').asinteger;
        qryInsParticipante.ParamByName('matricula').asstring :=
            qryParticipante.FieldByName('matricula').asstring;
        qryInsParticipante.ParamByName('nome').asstring :=
            qryParticipante.FieldByName('nome').asstring;
        qryInsParticipante.ParamByName('patroc').asInteger :=
            qryParticipante.FieldByName('patroc').asInteger;
        qryInsParticipante.ParamByName('plano').asInteger :=
            qryParticipante.FieldByName('plano').asInteger;
        qryInsParticipante.ParamByName('cd_entid').asInteger := Entid;

        //-- Recuperar Regional do Participante
        if qryParticipante.FieldByName('idestab').isnull then
          qryInsParticipante.ParamByName('regional').clear
        else
         begin
           wwQryRegional.close;
           wwQryRegional.ParamByName('idestab').asinteger :=
              qryParticipante.FieldByName('idestab').asinteger;
           wwQryRegional.open;

           if wwQryRegional.eof then
             qryInsParticipante.ParamByName('regional').clear
           else
             qryInsParticipante.ParamByName('regional').asstring :=
                wwQryRegional.FieldByName('regional').asstring;
         end;
       //-------------

        if qryParticipante.FieldByName('sexo').isNull then
          qryInsParticipante.ParamByName('sexo').Clear
        else
          qryInsParticipante.ParamByName('sexo').asstring :=
             qryParticipante.FieldByName('sexo').asstring;

        if qryParticipante.FieldByName('situacao_fundacao').isNull then
          qryInsParticipante.ParamByName('situacao_fundacao').Clear
        else
          qryInsParticipante.ParamByName('situacao_fundacao').asinteger :=
             qryParticipante.FieldByName('situacao_fundacao').asinteger;

        if qryParticipante.FieldByName('situacao_patrocinadora').isNull then
          qryInsParticipante.ParamByName('situacao_patrocinadora').Clear
        else
          qryInsParticipante.ParamByName('situacao_patrocinadora').asinteger :=
             qryParticipante.FieldByName('situacao_patrocinadora').asinteger;

        qryInsParticipante.ExecSQL;
      Except
        // -- Atualiza Participante
        qryUpdParticipante.ParamByName('nome').asstring :=
           qryParticipante.FieldByName('nome').asstring;
        qryUpdParticipante.ParamByName('matricula').asstring :=
           qryParticipante.FieldByName('matricula').asstring;
        qryUpdParticipante.ParamByName('cpf').asstring :=
           qryParticipante.FieldByName('cpf').asstring;

        if qryParticipante.FieldByName('estado_civil').isNull then
          qryUpdParticipante.ParamByName('estado_civil').Clear
        else
          qryUpdParticipante.ParamByName('estado_civil').asstring :=
             qryParticipante.FieldByName('estado_civil').asstring;

        if qryParticipante.FieldByName('sexo').isNull then
          qryUpdParticipante.ParamByName('sexo').Clear
        else
          qryUpdParticipante.ParamByName('sexo').asstring :=
             qryParticipante.FieldByName('sexo').asstring;

        if wwQryRegional.eof then
          qryUpdParticipante.ParamByName('regional').clear
        else
          qryUpdParticipante.ParamByName('regional').asstring :=
             wwQryRegional.FieldByName('regional').asstring;

        if qryParticipante.FieldByName('situacao_fundacao').isNull then
          qryUpdParticipante.ParamByName('situacao_fundacao').Clear
        else
          qryUpdParticipante.ParamByName('situacao_fundacao').asinteger :=
             qryParticipante.FieldByName('situacao_fundacao').asinteger;

        if qryParticipante.FieldByName('situacao_patrocinadora').isNull then
          qryUpdParticipante.ParamByName('situacao_patrocinadora').Clear
        else
          qryUpdParticipante.ParamByName('situacao_patrocinadora').asinteger :=
             qryParticipante.FieldByName('situacao_patrocinadora').asinteger;

        qryUpdParticipante.ParamByName('CD_VERSAO').asInteger := Versao;
        qryUpdParticipante.ParamByName('idtitular').asinteger :=
           qryParticipante.FieldByName('idtitular').asinteger;
        qryUpdParticipante.ExecSQL;
      End; //Try-Except

     id := qryParticipante.FieldByName('idtitular').asinteger;
     tp := qryParticipante.FieldByName('tipo_benef').asinteger;

     if frmAnimacao.Cancel Then
      Begin
        cancelado := true;
        frmAnimacao.Close;
        frmAnimacao.Free;
        ShowMessage('Processamento cancelado por intervenção do usuário');
        Exit;
      End;

      // -- Tempos do Participante
      // -- Data de Inscrição
      if not qryParticipante.FieldByName('data_inscricao').isNull then
        Try
          qryInsTempo.ParamByName('CD_PARTIC').Value := id;
          qryInsTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 1;
          qryInsTempo.ParamByName('CD_VERSAO').asInteger := Versao;
          qryInsTempo.ParamByName('DT_TEMPO').Value :=
             qryParticipante.FieldByName('data_inscricao').Value;

          qtempo := tempo(qryParticipante.FieldByName('data_inscricao').asDateTime, WG_DT_REFER_BASE);
          rtempo := qtempo.items[0];

          qryInsTempo.ParamByName('QT_DIA_TEMPO').asInteger := rtempo.dias;
          qryInsTempo.ParamByName('QT_MES_TEMPO').asInteger := rtempo.meses;
          qryInsTempo.ParamByName('QT_ANO_TEMPO').asInteger := rtempo.anos;
          qryInsTempo.ExecSQL;
        Except
          qryUpdTempo.ParamByName('CD_PARTIC').Value := id;
          qryUpdTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 1;
          qryUpdTempo.ParamByName('CD_VERSAO').asInteger := Versao;
          qryUpdTempo.ParamByName('DT_TEMPO').Value :=
             qryParticipante.FieldByName('data_inscricao').Value;
          qryUpdTempo.ParamByName('QT_DIA_TEMPO').asInteger := rtempo.dias;
          qryUpdTempo.ParamByName('QT_MES_TEMPO').asInteger := rtempo.meses;
          qryUpdTempo.ParamByName('QT_ANO_TEMPO').asInteger := rtempo.anos;
          qryUpdTempo.ExecSQL;
        End; //Try-Except

      //-- Data de Nascimento do Participante
      if not qryParticipante.FieldByName('data_nasc').isNull then
        Try
          qryInsTempo.ParamByName('CD_PARTIC').Value := id;
          qryInsTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 2;
          qryInsTempo.ParamByName('CD_VERSAO').asInteger := Versao;
          qryInsTempo.ParamByName('DT_TEMPO').Value :=
             qryParticipante.FieldByName('data_nasc').Value;

          qtempo := tempo(qryParticipante.FieldByName('data_nasc').asDateTime, WG_DT_REFER_BASE);
          rtempo := qtempo.items[0];

          qryInsTempo.ParamByName('QT_DIA_TEMPO').asInteger := rtempo.Dias;
          qryInsTempo.ParamByName('QT_MES_TEMPO').asInteger := rtempo.Meses;
          qryInsTempo.ParamByName('QT_ANO_TEMPO').asInteger := rtempo.Anos;
          qryInsTempo.ExecSQL;
        Except
          qryUpdTempo.ParamByName('CD_PARTIC').Value := id;
          qryUpdTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 2;
          qryUpdTempo.ParamByName('CD_VERSAO').asInteger := Versao;
          qryUpdTempo.ParamByName('DT_TEMPO').Value :=
             qryParticipante.FieldByName('data_nasc').Value;
          qryUpdTempo.ParamByName('QT_DIA_TEMPO').asInteger := rtempo.Dias;
          qryUpdTempo.ParamByName('QT_MES_TEMPO').asInteger := rtempo.Meses;
          qryUpdTempo.ParamByName('QT_ANO_TEMPO').asInteger := rtempo.Anos;
          qryUpdTempo.ExecSQL;
        End; //Try-Except

      //-- Data de admissao
      if not qryParticipante.FieldByName('data_admissao').isNull then
        Try
          qryInsTempo.ParamByName('CD_PARTIC').Value := id;
          qryInsTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 3;
          qryInsTempo.ParamByName('CD_VERSAO').asInteger := Versao;
          qryInsTempo.ParamByName('DT_TEMPO').Value :=
             qryParticipante.FieldByName('data_admissao').Value;

          qtempo := tempo(qryParticipante.FieldByName('data_admissao').asDateTime, WG_DT_REFER_BASE);
          rtempo := qtempo.items[0];

          qryInsTempo.ParamByName('QT_DIA_TEMPO').asInteger := rtempo.dias;
          qryInsTempo.ParamByName('QT_MES_TEMPO').asInteger := rtempo.meses;
          qryInsTempo.ParamByName('QT_ANO_TEMPO').asInteger := rtempo.anos;
          qryInsTempo.ExecSQL;
        Except
          qryUpdTempo.ParamByName('CD_PARTIC').Value := id;
          qryUpdTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 3;
          qryUpdTempo.ParamByName('CD_VERSAO').asInteger := Versao;
          qryUpdTempo.ParamByName('DT_TEMPO').Value :=
             qryParticipante.FieldByName('data_admissao').Value;
          qryUpdTempo.ParamByName('QT_DIA_TEMPO').asInteger := rtempo.dias;
          qryUpdTempo.ParamByName('QT_MES_TEMPO').asInteger := rtempo.meses;
          qryUpdTempo.ParamByName('QT_ANO_TEMPO').asInteger := rtempo.anos;
          qryUpdTempo.ExecSQL;
        End; //Try-Except

      //--Data de Início do Benefício
      if not qryParticipante.FieldByName('dib').isNull then
        Try
          qryInsTempo.ParamByName('CD_PARTIC').Value := id;
          qryInsTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 4;
          qryInsTempo.ParamByName('CD_VERSAO').asInteger := Versao;
          qryInsTempo.ParamByName('DT_TEMPO').Value :=
             qryParticipante.FieldByName('dib').Value;

          qtempo := tempo(qryParticipante.FieldByName('dib').asDateTime, WG_DT_REFER_BASE);
          rtempo := qtempo.items[0];             

          qryInsTempo.ParamByName('QT_DIA_TEMPO').asInteger := rtempo.dias;
          qryInsTempo.ParamByName('QT_MES_TEMPO').asInteger := rtempo.meses;
          qryInsTempo.ParamByName('QT_ANO_TEMPO').asInteger := rtempo.anos;
          qryInsTempo.ExecSQL;
        Except
          qryUpdTempo.ParamByName('CD_PARTIC').Value := id;
          qryUpdTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 4;
          qryUpdTempo.ParamByName('CD_VERSAO').asInteger := Versao;
          qryUpdTempo.ParamByName('DT_TEMPO').Value :=
             qryParticipante.FieldByName('dib').Value;
          qryUpdTempo.ParamByName('QT_DIA_TEMPO').asInteger := rtempo.dias;
          qryUpdTempo.ParamByName('QT_MES_TEMPO').asInteger := rtempo.meses;
          qryUpdTempo.ParamByName('QT_ANO_TEMPO').asInteger := rtempo.anos;
          qryUpdTempo.ExecSQL;
        End; //Try-Except

      //-- Tempo de Serviço do Participante
      if qryParticipante.FieldByName('tempo_serv_anterior').isnull then
        tempo_serv_anterior := 0
      else
        tempo_serv_anterior := qryParticipante.FieldByName('tempo_serv_anterior').asinteger;

      if qryParticipante.FieldByName('tempo_nao_creditado').isnull then
        tempo_nao_creditado := 0
      else
        tempo_nao_creditado := qryParticipante.FieldByName('tempo_nao_creditado').asinteger;

      if not qryParticipante.FieldByName('data_admissao').isNull then
        Try
          qryInsTempo.ParamByName('CD_PARTIC').Value := id;
          qryInsTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 6;
          qryInsTempo.ParamByName('CD_VERSAO').asInteger := Versao;
          qryInsTempo.ParamByName('DT_TEMPO').Clear;

          qtempo := tempo(qryParticipante.FieldByName('data_admissao').asDateTime, WG_DT_REFER_BASE);
          rtempo := qtempo.items[0];
          tempo_servico :=  rtempo.Anos + tempo_serv_anterior - tempo_nao_creditado;

          qryInsTempo.ParamByName('QT_DIA_TEMPO').asInteger := rtempo.Dias;
          qryInsTempo.ParamByName('QT_MES_TEMPO').asInteger := rtempo.Meses;
          qryInsTempo.ParamByName('QT_ANO_TEMPO').asInteger := tempo_servico;
          qryInsTempo.ExecSQL;
        Except
          qryUpdTempo.ParamByName('CD_PARTIC').Value := id;
          qryUpdTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 6;
          qryUpdTempo.ParamByName('CD_VERSAO').asInteger := Versao;
          qryUpdTempo.ParamByName('DT_TEMPO').Clear;
          qryUpdTempo.ParamByName('QT_DIA_TEMPO').asInteger := rtempo.Dias;
          qryUpdTempo.ParamByName('QT_MES_TEMPO').asInteger := rtempo.Meses;
          qryUpdTempo.ParamByName('QT_ANO_TEMPO').asInteger := tempo_servico;
          qryUpdTempo.ExecSQL;
        End; //Try-Except

      // Data do Último Salário de Participação
      QryUltimoSalario.Close;
      QryUltimoSalario.ParamByName('patroc').asInteger :=
          qryParticipante.FieldByName('patroc').asInteger;
      QryUltimoSalario.ParamByName('plano').asInteger :=
          qryParticipante.FieldByName('plano').asInteger;
      QryUltimoSalario.ParamByName('partic').asInteger := id;
      QryUltimoSalario.Open;

      if not QryUltimoSalario.FieldByName('data_ultimo_salario').isNull then
        Try
          aux_data := QryUltimoSalario.FieldByName('data_ultimo_salario').asString;

          try
            a := StrToInt(copy(aux_data, 6, 2));
          except
            a := 0;
          end;

          if (a >= 13) or (a <= 0) then
            aux_data := '01/12/' + copy(aux_data, 1, 4)
          else
            aux_data := '01/' + copy(aux_data, 6, 2) +'/'+ copy(aux_data, 1, 4);

          qryInsTempo.ParamByName('CD_PARTIC').Value := id;
          qryInsTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 7;
          qryInsTempo.ParamByName('CD_VERSAO').asInteger := Versao;
          if Trim(aux_data) = '' then
            qryInsTempo.ParamByName('DT_TEMPO').Clear
          else
            qryInsTempo.ParamByName('DT_TEMPO').asDatetime := StrToDate(aux_data);

          if Trim(aux_data) <> '' then
           begin
             qtempo := tempo(StrToDate(aux_data), WG_DT_REFER_BASE);
             rtempo := qtempo.items[0];
           end; 

          qryInsTempo.ParamByName('QT_DIA_TEMPO').asInteger := rtempo.dias;
          qryInsTempo.ParamByName('QT_MES_TEMPO').asInteger := rtempo.meses;
          qryInsTempo.ParamByName('QT_ANO_TEMPO').asInteger := rtempo.anos;
          qryInsTempo.ExecSQL;
        Except
          aux_data := QryUltimoSalario.FieldByName('data_ultimo_salario').asString;
          try
            a := StrToInt(copy(aux_data, 6, 2));
          except
            a := 0;
          end;

          if (a >= 13) or (a <= 0) then
            aux_data := '01/12/' + copy(aux_data, 1, 4)
          else
            aux_data := '01/' + copy(aux_data, 6, 2) + '/' + copy(aux_data, 1, 4);

          qryUpdTempo.ParamByName('CD_PARTIC').Value := id;
          qryUpdTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 7;
          qryUpdTempo.ParamByName('CD_VERSAO').asInteger := Versao;
          if trim(aux_data) = '' then
            qryUpdTempo.ParamByName('DT_TEMPO').Clear
          else
            qryUpdTempo.ParamByName('DT_TEMPO').asDateTime := StrToDate(aux_data);
          qryUpdTempo.ParamByName('QT_DIA_TEMPO').asInteger := rtempo.dias;
          qryUpdTempo.ParamByName('QT_MES_TEMPO').asInteger := rtempo.meses;
          qryUpdTempo.ParamByName('QT_ANO_TEMPO').asInteger := rtempo.anos;
          qryUpdTempo.ExecSQL;
        End; //Try-Except
      QryUltimoSalario.Close;

      //-- Data da Situação na Fundação
      //-- Se estiver nula e Participante Cancelado grava data de Cancelamento
      if (qryParticipante.FieldByName('data_sit_fundacao').isNull)
         and (qryParticipante.FieldByName('ind_situacao_patroc').asString = 'CA')
         and (not qryParticipante.FieldByName('data_cancelamento').isNull) then
        Try
          qryInsTempo.ParamByName('CD_PARTIC').Value := id;
          qryInsTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 8;
          qryInsTempo.ParamByName('CD_VERSAO').asInteger := Versao;
          qryInsTempo.ParamByName('DT_TEMPO').Value :=
             qryParticipante.FieldByName('data_cancelamento').Value;

          qtempo := tempo(qryParticipante.FieldByName('data_cancelamento').asDateTime, WG_DT_REFER_BASE);
          rtempo := qtempo.items[0];

          qryInsTempo.ParamByName('QT_DIA_TEMPO').asInteger := rtempo.dias;
          qryInsTempo.ParamByName('QT_MES_TEMPO').asInteger := rtempo.meses;
          qryInsTempo.ParamByName('QT_ANO_TEMPO').asInteger := rtempo.anos;
          qryInsTempo.ExecSQL;
        Except
          qryUpdTempo.ParamByName('CD_PARTIC').Value := id;
          qryUpdTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 8;
          qryUpdTempo.ParamByName('CD_VERSAO').asInteger := Versao;
          qryUpdTempo.ParamByName('DT_TEMPO').Value :=
             qryParticipante.FieldByName('data_cancelamento').Value;
          qryUpdTempo.ParamByName('QT_DIA_TEMPO').asInteger := rtempo.dias;
          qryUpdTempo.ParamByName('QT_MES_TEMPO').asInteger := rtempo.meses;
          qryUpdTempo.ParamByName('QT_ANO_TEMPO').asInteger := rtempo.anos;
          qryUpdTempo.ExecSQL;
        End //Try-Except
      else if not qryParticipante.FieldByName('data_sit_fundacao').isNull then
        Try
          qryInsTempo.ParamByName('CD_PARTIC').Value := id;
          qryInsTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 8;
          qryInsTempo.ParamByName('CD_VERSAO').asInteger := Versao;
          qryInsTempo.ParamByName('DT_TEMPO').Value :=
             qryParticipante.FieldByName('data_sit_fundacao').Value;

          qtempo := tempo(qryParticipante.FieldByName('data_sit_fundacao').asDateTime, WG_DT_REFER_BASE);
          rtempo := qtempo.items[0];

          qryInsTempo.ParamByName('QT_DIA_TEMPO').asInteger := rtempo.dias;
          qryInsTempo.ParamByName('QT_MES_TEMPO').asInteger := rtempo.meses;
          qryInsTempo.ParamByName('QT_ANO_TEMPO').asInteger := rtempo.anos;
          qryInsTempo.ExecSQL;
        Except
          qryUpdTempo.ParamByName('CD_PARTIC').Value := id;
          qryUpdTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 8;
          qryUpdTempo.ParamByName('CD_VERSAO').asInteger := Versao;
          qryUpdTempo.ParamByName('DT_TEMPO').Value :=
             qryParticipante.FieldByName('data_sit_fundacao').Value;
          qryUpdTempo.ParamByName('QT_DIA_TEMPO').asInteger := rtempo.dias;
          qryUpdTempo.ParamByName('QT_MES_TEMPO').asInteger := rtempo.meses;
          qryUpdTempo.ParamByName('QT_ANO_TEMPO').asInteger := rtempo.anos;
          qryUpdTempo.ExecSQL;
        End; //Try-Except

      //-- Data da Situação na Patrocinadora
      //-- Se estiver nula e Participante Cancelado grava data de Cancelamento
      if (qryParticipante.FieldByName('data_sit_patrocinadora').isNull)
         and (qryParticipante.FieldByName('ind_situacao_patroc').asString = 'CA')
         and (not qryParticipante.FieldByName('data_cancelamento').isNull) then
        Try
          qryInsTempo.ParamByName('CD_PARTIC').Value := id;
          qryInsTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 9;
          qryInsTempo.ParamByName('CD_VERSAO').asInteger := Versao;
          qryInsTempo.ParamByName('DT_TEMPO').Value :=
             qryParticipante.FieldByName('data_cancelamento').Value;

          qtempo := tempo(qryParticipante.FieldByName('data_cancelamento').asDateTime, WG_DT_REFER_BASE);
          rtempo := qtempo.items[0];

          qryInsTempo.ParamByName('QT_DIA_TEMPO').asInteger := rtempo.dias;
          qryInsTempo.ParamByName('QT_MES_TEMPO').asInteger := rtempo.meses;
          qryInsTempo.ParamByName('QT_ANO_TEMPO').asInteger := rtempo.anos;
          qryInsTempo.ExecSQL;
        Except
          qryUpdTempo.ParamByName('CD_PARTIC').Value := id;
          qryUpdTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 9;
          qryUpdTempo.ParamByName('CD_VERSAO').asInteger := Versao;
          qryUpdTempo.ParamByName('DT_TEMPO').Value :=
             qryParticipante.FieldByName('data_cancelamento').Value;
          qryUpdTempo.ParamByName('QT_DIA_TEMPO').asInteger := rtempo.dias;
          qryUpdTempo.ParamByName('QT_MES_TEMPO').asInteger := rtempo.meses;
          qryUpdTempo.ParamByName('QT_ANO_TEMPO').asInteger := rtempo.anos;
          qryUpdTempo.ExecSQL;
        End //Try-Except
      else if not qryParticipante.FieldByName('data_sit_patrocinadora').isNull then
        Try
          qryInsTempo.ParamByName('CD_PARTIC').Value := id;
          qryInsTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 9;
          qryInsTempo.ParamByName('CD_VERSAO').asInteger := Versao;
          qryInsTempo.ParamByName('DT_TEMPO').Value :=
             qryParticipante.FieldByName('data_sit_patrocinadora').Value;

          qtempo := tempo(qryParticipante.FieldByName('data_sit_patrocinadora').asDateTime, WG_DT_REFER_BASE);
          rtempo := qtempo.items[0];

          qryInsTempo.ParamByName('QT_DIA_TEMPO').asInteger := rtempo.dias;
          qryInsTempo.ParamByName('QT_MES_TEMPO').asInteger := rtempo.meses;
          qryInsTempo.ParamByName('QT_ANO_TEMPO').asInteger := rtempo.anos;
          qryInsTempo.ExecSQL;
        Except
          qryUpdTempo.ParamByName('CD_PARTIC').Value := id;
          qryUpdTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 9;
          qryUpdTempo.ParamByName('CD_VERSAO').asInteger := Versao;
          qryUpdTempo.ParamByName('DT_TEMPO').Value :=
             qryParticipante.FieldByName('data_sit_patrocinadora').Value;
          qryUpdTempo.ParamByName('QT_DIA_TEMPO').asInteger := rtempo.dias;
          qryUpdTempo.ParamByName('QT_MES_TEMPO').asInteger := rtempo.meses;
          qryUpdTempo.ParamByName('QT_ANO_TEMPO').asInteger := rtempo.anos;
          qryUpdTempo.ExecSQL;
        End; //Try-Except


      //-- Valores do Participante
      //-- Salário de Participação
      if not qryParticipante.FieldByName('salario_participacao').isnull then
        Try
          qryInsValor.ParamByName('CD_PARTIC').Value := id;
          qryInsValor.ParamByName('CD_TIPO_VALOR').asInteger := 1;
          qryInsValor.ParamByName('CD_VERSAO').asInteger := Versao;
          qryInsValor.ParamByName('VL_PARTICIPANTE').Value :=
             qryParticipante.FieldByName('salario_participacao').Value;
          qryInsValor.ExecSQL;
        Except
          qryUpdValor.ParamByName('CD_PARTIC').Value := id;
          qryUpdValor.ParamByName('CD_TIPO_VALOR').asInteger := 1;
          qryUpdValor.ParamByName('CD_VERSAO').asInteger := Versao;
          qryUpdValor.ParamByName('VL_PARTICIPANTE').Value :=
             qryParticipante.FieldByName('salario_participacao').Value;
          qryUpdValor.ExecSQL;
        End; //Try-Except

      //-- Valor do Benefico
      if not qryParticipante.FieldByName('valor_benef').isNull  then
        Try
          qryInsValor.ParamByName('CD_PARTIC').Value := id;

          //-- Verifica qual o tipo de beneficio
          wwQryVerifBenef.close;
          wwQryVerifBenef.parambyname('CD_TIPO_BENEF').asinteger := tp;
          wwQryVerifBenef.open;
          if pos('ABONO', trim(UpperCase(wwQryVerifBenef.fieldbyname('SG_TIPO_BENEF').asstring))) > 0  then
            qryInsValor.ParamByName('CD_TIPO_VALOR').asInteger := 11
          else if pos('INSS', trim(UpperCase(wwQryVerifBenef.fieldbyname('SG_TIPO_BENEF').asstring))) > 0 then
            qryInsValor.ParamByName('CD_TIPO_VALOR').asInteger := 12
          else
            qryInsValor.ParamByName('CD_TIPO_VALOR').asInteger := 2;

             qryInsValor.ParamByName('CD_VERSAO').asInteger := Versao;
             qryInsValor.ParamByName('VL_PARTICIPANTE').Value :=
                qryParticipante.FieldByName('valor_benef').Value;
             qryInsValor.ExecSQL;

          QryValorBeneficio.Close;
        Except
          qryUpdValor.ParamByName('CD_PARTIC').Value := id;

          if pos('ABONO', trim(UpperCase(wwQryVerifBenef.fieldbyname('SG_TIPO_BENEF').asstring))) > 0 then
            qryUpdValor.ParamByName('CD_TIPO_VALOR').asInteger := 11
          else if pos('INSS', trim(UpperCase(wwQryVerifBenef.fieldbyname('SG_TIPO_BENEF').asstring))) > 0 then
            qryUpdValor.ParamByName('CD_TIPO_VALOR').asInteger := 12
          else
            qryUpdValor.ParamByName('CD_TIPO_VALOR').asInteger := 2;

             qryUpdValor.ParamByName('CD_VERSAO').asInteger := Versao;
             qryUpdValor.ParamByName('VL_PARTICIPANTE').Value :=
                qryParticipante.FieldByName('valor_benef').Value;
             qryUpdValor.ExecSQL;
        End; //Try-Except
        QryValorBeneficio.Close;

      //-- Percentual de Contribuição
      if not qryParticipante.FieldByName('perc_contribuicao').isNull then
        Try
          qryInsValor.ParamByName('CD_PARTIC').Value := id;
          qryInsValor.ParamByName('CD_TIPO_VALOR').asInteger := 3;
          qryInsValor.ParamByName('CD_VERSAO').asInteger := Versao;
          qryInsValor.ParamByName('VL_PARTICIPANTE').Value :=
             qryParticipante.FieldByName('perc_contribuicao').Value;
          qryInsValor.ExecSQL;
        Except
          qryUpdValor.ParamByName('CD_PARTIC').Value := id;
          qryUpdValor.ParamByName('CD_TIPO_VALOR').asInteger := 3;
          qryUpdValor.ParamByName('CD_VERSAO').asInteger := Versao;
          qryUpdValor.ParamByName('VL_PARTICIPANTE').Value :=
             qryParticipante.FieldByName('perc_contribuicao').Value;
          qryUpdValor.ExecSQL;
        End; //Try-Except

      //-- Saldo de Contribuição
      if not qryParticipante.FieldByName('saldo_assistido').isnull then
         Try
           qryInsValor.ParamByName('CD_PARTIC').Value := id;
           qryInsValor.ParamByName('CD_TIPO_VALOR').asInteger := 4;
           qryInsValor.ParamByName('CD_VERSAO').asInteger := Versao;
           qryInsValor.ParamByName('VL_PARTICIPANTE').Value :=
              qryParticipante.FieldByName('saldo_assistido').Value;
           qryInsValor.ExecSQL;
         Except
           qryUpdValor.ParamByName('CD_PARTIC').Value := id;
           qryUpdValor.ParamByName('CD_TIPO_VALOR').asInteger := 4;
           qryUpdValor.ParamByName('CD_VERSAO').asInteger := Versao;
           qryUpdValor.ParamByName('VL_PARTICIPANTE').Value :=
              qryParticipante.FieldByName('saldo_assistido').Value;
           qryUpdValor.ExecSQL;
         End; //Try-Except

      //-- Salário Médio de Contribuição
      if not qryParticipante.FieldByName('salario_medio').isnull then
        Try
          qryInsValor.ParamByName('CD_PARTIC').Value := id;
          qryInsValor.ParamByName('CD_TIPO_VALOR').asInteger := 5;
          qryInsValor.ParamByName('CD_VERSAO').asInteger := Versao;
          qryInsValor.ParamByName('VL_PARTICIPANTE').Value :=
             qryParticipante.FieldByName('salario_medio').Value;
          qryInsValor.ExecSQL;
        Except
          qryUpdValor.ParamByName('CD_PARTIC').Value := id;
          qryUpdValor.ParamByName('CD_TIPO_VALOR').asInteger := 5;
          qryUpdValor.ParamByName('CD_VERSAO').asInteger := Versao;
          qryUpdValor.ParamByName('VL_PARTICIPANTE').Value :=
             qryParticipante.FieldByName('salario_medio').Value;
          qryUpdValor.ExecSQL;
        End; //Try-Except

      //-- Saldo de Contribuição do Participante
      if not qryParticipante.FieldByName('saldo_partic').isnull then
        Try
          qryInsValor.ParamByName('CD_PARTIC').Value := id;
          qryInsValor.ParamByName('CD_TIPO_VALOR').asInteger := 6;
          qryInsValor.ParamByName('CD_VERSAO').asInteger := Versao;
          qryInsValor.ParamByName('VL_PARTICIPANTE').Value :=
             qryParticipante.FieldByName('saldo_partic').Value;
          qryInsValor.ExecSQL;
        Except
          qryUpdValor.ParamByName('CD_PARTIC').Value := id;
          qryUpdValor.ParamByName('CD_TIPO_VALOR').asInteger := 6;
          qryUpdValor.ParamByName('CD_VERSAO').asInteger := Versao;
          qryUpdValor.ParamByName('VL_PARTICIPANTE').Value :=
             dtmImportacao.qryParticipante.FieldByName('saldo_partic').Value;
          qryUpdValor.ExecSQL;
        End; //Try-Except

      //-- Saldo de Contribuição da Patrocinadora
      if not qryParticipante.FieldByName('saldo_patroc').isnull then
        Try
          qryInsValor.ParamByName('CD_PARTIC').Value := id;
          qryInsValor.ParamByName('CD_TIPO_VALOR').asInteger := 7;
          qryInsValor.ParamByName('CD_VERSAO').asInteger := Versao;
          qryInsValor.ParamByName('VL_PARTICIPANTE').Value :=
             qryParticipante.FieldByName('saldo_patroc').Value;
          qryInsValor.ExecSQL;
        Except
          qryUpdValor.ParamByName('CD_PARTIC').Value := id;
          qryUpdValor.ParamByName('CD_TIPO_VALOR').asInteger := 7;
          qryUpdValor.ParamByName('CD_VERSAO').asInteger := Versao;
          qryUpdValor.ParamByName('VL_PARTICIPANTE').Value :=
             qryParticipante.FieldByName('saldo_patroc').Value;
          qryUpdValor.ExecSQL;
        End; //Try-Except

      //-- Saldo de Transferência do Participante
      if not qryParticipante.FieldByName('saldo_trans_partic').isnull then
        Try
          qryInsValor.ParamByName('CD_PARTIC').Value := id;
          qryInsValor.ParamByName('CD_TIPO_VALOR').asInteger := 8;
          qryInsValor.ParamByName('CD_VERSAO').asInteger := Versao;
          qryInsValor.ParamByName('VL_PARTICIPANTE').Value :=
             qryParticipante.FieldByName('saldo_trans_partic').Value;
          qryInsValor.ExecSQL;
        Except
          qryUpdValor.ParamByName('CD_PARTIC').Value := id;
          qryUpdValor.ParamByName('CD_TIPO_VALOR').asInteger := 8;
          qryUpdValor.ParamByName('CD_VERSAO').asInteger := Versao;
          qryUpdValor.ParamByName('VL_PARTICIPANTE').Value :=
             qryParticipante.FieldByName('saldo_trans_partic').Value;
          qryUpdValor.ExecSQL;
        End; //Try-Except

      //-- Saldo de Tranferência da Patrociandora
      if not qryParticipante.FieldByName('saldo_trans_patroc').isnull then
        Try
          qryInsValor.ParamByName('CD_PARTIC').Value := id;
          qryInsValor.ParamByName('CD_TIPO_VALOR').asInteger := 9;
          qryInsValor.ParamByName('CD_VERSAO').asInteger := Versao;
          qryInsValor.ParamByName('VL_PARTICIPANTE').Value :=
             qryParticipante.FieldByName('saldo_trans_patroc').Value;
          qryInsValor.ExecSQL;
        Except
          qryUpdValor.ParamByName('CD_PARTIC').Value := id;
          qryUpdValor.ParamByName('CD_TIPO_VALOR').asInteger := 9;
          qryUpdValor.ParamByName('CD_VERSAO').asInteger := Versao;
          qryUpdValor.ParamByName('VL_PARTICIPANTE').Value :=
             qryParticipante.FieldByName('saldo_trans_patroc').Value;
          qryUpdValor.ExecSQL;
        End; //Try-Except

      //-- Garantia
      if not qryParticipante.FieldByName('garantia').isnull then
        Try
          qryInsValor.ParamByName('CD_PARTIC').Value := id;
          qryInsValor.ParamByName('CD_TIPO_VALOR').asInteger := 10;
          qryInsValor.ParamByName('CD_VERSAO').asInteger := Versao;
          qryInsValor.ParamByName('VL_PARTICIPANTE').Value :=
             qryParticipante.FieldByName('garantia').Value;
          qryInsValor.ExecSQL;
        Except
          qryUpdValor.ParamByName('CD_PARTIC').Value := id;
          qryUpdValor.ParamByName('CD_TIPO_VALOR').asInteger := 10;
          qryUpdValor.ParamByName('CD_VERSAO').asInteger := Versao;
          qryUpdValor.ParamByName('VL_PARTICIPANTE').Value :=
             qryParticipante.FieldByName('garantia').Value;
          qryUpdValor.ExecSQL;
        End; // Try-Except


      {Valores de Contribuicao do Participante}
      InsereTaxaContribPartic(
         qryParticipante.FieldByName('patroc').asInteger,
         qryParticipante.FieldByName('plano').asInteger, Versao, id);

      if dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.Commit;

      //-- Dependentes/Beneficiário
      Try
       InsereDependenteAtivo(
           qryParticipante.FieldByName('patroc').asInteger,
           qryParticipante.FieldByName('plano').asInteger, id, Versao);

       if not dtmImportacao.qryParticipante.FieldByName('tipo_benef').isnull then
        begin
          //-- Verifica qual o tipo de beneficio
          wwQryVerifBenef.close;
          wwQryVerifBenef.parambyname('CD_TIPO_BENEF').asinteger := tp;
          wwQryVerifBenef.open;
          if not ((pos('ABONO', trim(UpperCase(wwQryVerifBenef.fieldbyname('SG_TIPO_BENEF').asstring))) <= 0) or
             (pos('INSS', trim(UpperCase(wwQryVerifBenef.fieldbyname('SG_TIPO_BENEF').asstring))) <= 0)) then
            InsereDependente(
                qryParticipante.FieldByName('patroc').asInteger,
                qryParticipante.FieldByName('plano').asInteger, id, tp, Versao);
          wwQryVerifBenef.close;

          //Beneficiario
          InsereBeneficiario(
              qryParticipante.FieldByName('patroc').asInteger,
              qryParticipante.FieldByName('plano').asInteger, id, Versao);
        end;
      Except
        falhou := True;
        exit;
      End;

      qryParticipante.Next;
     end; //while
   end;//with

  frmAnimacao.Close;
  frmAnimacao.Free;
  qtempo.free;
end;

procedure InsereBeneficiario(Patroc, Plano, Partic, Versao: Integer);
var
  tp: Integer;
begin
  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;
    
  with dtmImportacao do
   begin
     qryBeneficiario.Close;
     qryBeneficiario.ParamByName('patroc').asInteger := Patroc;
     qryBeneficiario.ParamByName('plano').asInteger := Plano;
     qryBeneficiario.ParamByName('idtitular').asInteger := Partic;
     qryBeneficiario.Open;

     while not qryBeneficiario.EOF do
      begin
        Try
          tp := qryBeneficiario.FieldByName('beneficio').asInteger;

          qryInsDependente.ParamByName('CD_VERSAO').asInteger := Versao;
          qryInsDependente.ParamByName('cod_dependente').Value := Partic;
          qryInsDependente.ParamByName('data_nasc').Value :=
             qryBeneficiario.FieldByName('data_nasc').Value;

          //-- Cálculo da idade
          qryInsDependente.ParamByName('idade').clear;

          if qryBeneficiario.FieldByName('data_nasc').isnull then
            qryInsDependente.ParamByName('idade').clear
          else
           begin
             qtempo := tempo(qryBeneficiario.FieldByName('data_nasc').asDateTime, WG_DT_REFER_BASE);
             rtempo := qtempo.items[0];
             qryInsDependente.ParamByName('idade').asInteger := rtempo.Anos;
           end;

          if (Trim(qryBeneficiario.FieldByName('duracao').value) = '') or
             (qryBeneficiario.FieldByName('duracao').isnull )    then
            qryInsDependente.ParamByName('duracao').clear
          else
            qryInsDependente.ParamByName('duracao').asInteger :=
               qryBeneficiario.FieldByName('duracao').asInteger;

          if qryBeneficiario.FieldByName('dep_invalido').asInteger = 1 then
            qryInsDependente.ParamByName('grau_dependencia').asstring := 'INV';

          qryInsDependente.ParamByName('grau_dependencia').clear;
          qryInsDependente.ParamByName('id_titular').Value := Partic;
          qryInsDependente.ParamByName('matricula').Clear;
          qryInsDependente.ParamByName('nome').Value :=
             qryBeneficiario.FieldByName('nome').Value;
          qryInsDependente.ParamByName('sexo').Value :=
             qryBeneficiario.FieldByName('sexo').Value;
          qryInsDependente.ParamByName('titular').asString := 'S';
          qryInsDependente.ParamByName('patroc').asInteger := Patroc;
          qryInsDependente.ParamByName('entidade').asInteger := WG_CD_PESSOA_ENTID;
          qryInsDependente.ParamByName('plano').asInteger := Plano;
          qryInsDependente.ParamByName('beneficio').asInteger := tp;
          qryInsDependente.ParamByName('versao_tit').Clear;
          qryInsDependente.ParamByName('partic_tit').Clear;
          qryInsDependente.ParamByName('dependente_tit').Clear;
          qryInsDependente.execsql;
        Except
          qryUpdDependente.ParamByName('CD_VERSAO').asInteger := Versao;
          qryUpdDependente.ParamByName('cod_dependente').Value := Partic;
          qryUpdDependente.ParamByName('data_nasc').Value :=
             qryBeneficiario.FieldByName('data_nasc').Value;

          //-- Cálculo da idade
          qryUpdDependente.ParamByName('idade').clear;

          if qryBeneficiario.FieldByName('data_nasc').isnull then
            qryUpdDependente.ParamByName('idade').clear
          else
            qryUpdDependente.ParamByName('idade').asInteger := rtempo.Anos;

          if (Trim(qryBeneficiario.FieldByName('duracao').value) = '') or
             (qryBeneficiario.FieldByName('duracao').isnull )    then
            qryUpdDependente.ParamByName('duracao').clear
          else
            qryUpdDependente.ParamByName('duracao').asinteger :=
               qryBeneficiario.FieldByName('duracao').asinteger;

          if qryBeneficiario.FieldByName('dep_invalido').asInteger = 1 then
            qryInsDependente.ParamByName('grau_dependencia').asstring := 'INV';

          qryUpdDependente.ParamByName('grau_dependencia').Clear;
          qryUpdDependente.ParamByName('id_titular').Value := Partic;
          qryUpdDependente.ParamByName('matricula').Clear;
          qryUpdDependente.ParamByName('nome').Value :=
             qryBeneficiario.FieldByName('nome').Value;
          qryUpdDependente.ParamByName('sexo').Value :=
             qryBeneficiario.FieldByName('sexo').Value;
          qryUpdDependente.ParamByName('beneficio').asInteger := tp;
          qryUpdDependente.execsql;
        End;
        qryBeneficiario.Next;
      end; //while
   end;//with

  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Commit;
end;

procedure InsereDependente(Patroc, Plano, Partic, Benef, Versao: Integer);
begin
  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  with dtmImportacao do
   begin
     qryDependente.Close;
     qryDependente.ParamByName('patroc').asInteger := Patroc;
     qryDependente.ParamByName('plano').asInteger := Plano;
     qryDependente.ParamByName('idtitular').asInteger := Partic;
     qryDependente.Open;

     while not qryDependente.EOF do
      begin
        Try
          qryInsDependente.ParamByName('CD_VERSAO').asInteger := Versao;
          qryInsDependente.ParamByName('cod_dependente').Value :=
             qryDependente.FieldByName('cod_dependente').Value;
          qryInsDependente.ParamByName('data_nasc').Value :=
             qryDependente.FieldByName('data_nasc').Value;
          qryInsDependente.ParamByName('beneficio').asInteger := Benef;

          //-- Cálculo da idade
          qryInsDependente.ParamByName('idade').clear;

          if qryDependente.FieldByName('data_nasc').isnull then
            qryInsDependente.ParamByName('idade').clear
          else
           begin
             qtempo := tempo(qryDependente.FieldByName('data_nasc').asDateTime, WG_DT_REFER_BASE);
             rtempo := qtempo.items[0];
             qryInsDependente.ParamByName('idade').asInteger := rtempo.Anos;
           end;

          if (Trim(qryDependente.FieldByName('duracao').value) = '') or
             (qryDependente.FieldByName('duracao').isnull )    then
            qryInsDependente.ParamByName('duracao').clear
          else
            qryInsDependente.ParamByName('duracao').asInteger :=
               qryDependente.FieldByName('duracao').asInteger;

          if qryDependente.FieldByName('dep_invalido').asInteger = 1 then
            qryInsDependente.ParamByName('grau_dependencia').asstring := 'INV'
          else if qryDependente.FieldByName('grau_dependencia').isnull then
            qryInsDependente.ParamByName('grau_dependencia').clear
          else
            qryInsDependente.ParamByName('grau_dependencia').asstring :=
               qryDependente.FieldByName('grau_dependencia').asstring;

          qryInsDependente.ParamByName('id_titular').Value := Partic;
          qryInsDependente.ParamByName('matricula').Value :=
             qryDependente.FieldByName('matricula').Value;
          qryInsDependente.ParamByName('nome').Value :=
             qryDependente.FieldByName('nome').Value;
          qryInsDependente.ParamByName('sexo').Value :=
             qryDependente.FieldByName('sexo').Value;

          if (qryDependente.FieldByName('cod_responsavel').asInteger <>
             qryDependente.FieldByName('cod_dependente').asInteger) then
           begin
             qryInsDependente.ParamByName('titular').asString := 'N';
             qryInsDependente.ParamByName('patroc').asInteger := Patroc;
             qryInsDependente.ParamByName('entidade').asInteger := WG_CD_PESSOA_ENTID;
             qryInsDependente.ParamByName('plano').asInteger := Plano;
             qryInsDependente.ParamByName('versao_tit').asInteger := Versao;
             qryInsDependente.ParamByName('partic_tit').asInteger := Partic;
             qryInsDependente.ParamByName('dependente_tit').asInteger :=
                qryDependente.FieldByName('cod_responsavel').asInteger;
           end
          else
           begin
             qryInsDependente.ParamByName('titular').asString := 'S';
             qryInsDependente.ParamByName('patroc').asInteger := Patroc;
             qryInsDependente.ParamByName('entidade').asInteger := WG_CD_PESSOA_ENTID;
             qryInsDependente.ParamByName('plano').asInteger := Plano;
             qryInsDependente.ParamByName('versao_tit').Clear;
             qryInsDependente.ParamByName('partic_tit').Clear;
             qryInsDependente.ParamByName('dependente_tit').Clear;
           end;

          qryInsDependente.ExecSQL;
        Except
          qryUpdDependente.ParamByName('CD_VERSAO').asInteger := Versao;
          qryUpdDependente.ParamByName('cod_dependente').Value :=
             qryDependente.FieldByName('cod_dependente').Value;
          qryUpdDependente.ParamByName('data_nasc').Value :=
             qryDependente.FieldByName('data_nasc').Value;
          qryUpdDependente.ParamByName('beneficio').asInteger := Benef;

          //-- Cálculo da idade
          qryUpdDependente.ParamByName('idade').clear;

          if qryDependente.FieldByName('data_nasc').isnull then
            qryUpdDependente.ParamByName('idade').clear
          else
            qryUpdDependente.ParamByName('idade').asInteger := rtempo.Anos;

          if (Trim(qryDependente.FieldByName('duracao').value) = '') or
             (qryDependente.FieldByName('duracao').isnull ) then
            qryUpdDependente.ParamByName('duracao').clear
          else
            qryUpdDependente.ParamByName('duracao').asinteger :=
               qryDependente.FieldByName('duracao').asinteger;

          if qryDependente.FieldByName('dep_invalido').asInteger = 1 then
            qryInsDependente.ParamByName('grau_dependencia').asstring := 'INV'
          else if qryDependente.FieldByName('grau_dependencia').isnull then
            qryUpdDependente.ParamByName('grau_dependencia').clear
          else
            qryUpdDependente.ParamByName('grau_dependencia').asstring :=
               qryDependente.FieldByName('grau_dependencia').asstring;

          qryUpdDependente.ParamByName('id_titular').Value := Partic;
          qryUpdDependente.ParamByName('matricula').Value :=
             qryDependente.FieldByName('matricula').Value;
          qryUpdDependente.ParamByName('nome').Value :=
             qryDependente.FieldByName('nome').Value;
          qryUpdDependente.ParamByName('sexo').Value :=
             qryDependente.FieldByName('sexo').Value;
          qryUpdDependente.execsql;
        End; //Try-Except
        qryDependente.Next;
      end; //while
   end;//with

  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Commit;
end;

procedure InsereDependenteAtivo(Patroc, Plano, Partic, Versao: integer);
begin
  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  with dtmImportacao do
   begin
     qryDependenteAtivo.Close;
     qryDependenteAtivo.ParamByName('idtitular').asInteger := Partic;
     qryDependenteAtivo.Open;

     while not qryDependenteAtivo.EOF do
      begin
        Try
          qryInsDependente.ParamByName('CD_VERSAO').asInteger := Versao;
          qryInsDependente.ParamByName('cod_dependente').Value :=
             qryDependenteAtivo.FieldByName('cod_dependente').Value;
          qryInsDependente.ParamByName('data_nasc').Value :=
             qryDependenteAtivo.FieldByName('data_nasc').Value;

          //-- Cálculo da idade
          qryInsDependente.ParamByName('idade').clear;

          if qryDependenteAtivo.FieldByName('data_nasc').isnull then
            qryInsDependente.ParamByName('idade').clear
          else
           begin
             qtempo := tempo(qryDependenteAtivo.FieldByName('data_nasc').asDateTime, WG_DT_REFER_BASE);
             rtempo := qtempo.items[0];
             qryInsDependente.ParamByName('idade').asInteger := rtempo.Anos;
           end;

          qryInsDependente.ParamByName('duracao').clear;

          if qryDependenteAtivo.FieldByName('dep_invalido').asInteger = 1 then
            qryInsDependente.ParamByName('grau_dependencia').asstring := 'INV'
          else if qryDependenteAtivo.FieldByName('grau_dependencia').isnull then
            qryInsDependente.ParamByName('grau_dependencia').clear
          else
            qryInsDependente.ParamByName('grau_dependencia').asstring :=
               qryDependenteAtivo.FieldByName('grau_dependencia').asstring;

          qryInsDependente.ParamByName('id_titular').Value := Partic;
          qryInsDependente.ParamByName('matricula').Value :=
             qryDependenteAtivo.FieldByName('matricula').Value;
          qryInsDependente.ParamByName('nome').Value :=
             qryDependenteAtivo.FieldByName('nome').Value;
          qryInsDependente.ParamByName('sexo').Value :=
             qryDependenteAtivo.FieldByName('sexo').Value;

          qryInsDependente.ParamByName('titular').asString := 'N';
          qryInsDependente.ParamByName('patroc').Clear;
          qryInsDependente.ParamByName('entidade').Clear;
          qryInsDependente.ParamByName('plano').Clear;
          qryInsDependente.ParamByName('beneficio').Clear;
          qryInsDependente.ParamByName('versao_tit').Clear;
          qryInsDependente.ParamByName('partic_tit').Clear;
          qryInsDependente.ParamByName('dependente_tit').Clear;
          qryInsDependente.execsql;
        Except
          qryUpdDependente.ParamByName('CD_VERSAO').asInteger := Versao;
          qryUpdDependente.ParamByName('cod_dependente').Value :=
             qryDependenteAtivo.FieldByName('cod_dependente').Value;
          qryUpdDependente.ParamByName('data_nasc').Value :=
             qryDependenteAtivo.FieldByName('data_nasc').Value;
          qryUpdDependente.ParamByName('beneficio').Clear;   

          //-- Cálculo da idade
          qryUpdDependente.ParamByName('idade').clear;

          if qryDependenteAtivo.FieldByName('data_nasc').isnull then
            qryUpdDependente.ParamByName('idade').clear
          else
            qryUpdDependente.ParamByName('idade').asInteger := rtempo.Anos;

          qryUpdDependente.ParamByName('duracao').clear;

          if qryDependenteAtivo.FieldByName('dep_invalido').asInteger = 1 then
            qryInsDependente.ParamByName('grau_dependencia').asstring := 'INV'
          else if qryDependenteAtivo.FieldByName('grau_dependencia').isnull then
            qryUpdDependente.ParamByName('grau_dependencia').clear
          else
            qryUpdDependente.ParamByName('grau_dependencia').asstring :=
               qryDependenteAtivo.FieldByName('grau_dependencia').asstring;

          qryUpdDependente.ParamByName('id_titular').Value := Partic;
          qryUpdDependente.ParamByName('matricula').Value :=
             qryDependenteAtivo.FieldByName('matricula').Value;
          qryUpdDependente.ParamByName('nome').Value :=
             qryDependenteAtivo.FieldByName('nome').Value;
          qryUpdDependente.ParamByName('sexo').Value :=
             qryDependenteAtivo.FieldByName('sexo').Value;
          qryUpdDependente.execsql;
        End; //Try-Except
        qryDependenteAtivo.Next;
      end; //while
   end;//with

  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Commit;
end;

procedure InsereTaxaContribPartic(Patroc, Plano, Versao, Partic: Integer);
begin
  with DtmImportacao do
   begin
     qryTaxaContribPartic.Close;
     qryTaxaContribPartic.ParamByName('patroc').asInteger := Patroc;
     qryTaxaContribPartic.ParamByName('plano').asInteger := Plano;
     qryTaxaContribPartic.ParamByName('partic').asInteger := Partic;
     qryTaxaContribPartic.Open;

     while not qryTaxaContribPartic.Eof do
      begin
        case qryTaxaContribPartic.FieldByName('IDCONTRIBUICAO').asInteger of
          1: if not qryTaxaContribPartic.FieldByName('VALORBASE1').isNull then
               InsereTipoValor(Versao, Partic, 18, qryTaxaContribPartic.FieldByName('VALORBASE1').asFloat);

          2: if not qryTaxaContribPartic.FieldByName('VALORBASE1').isNull then
               InsereTipoValor(Versao, Partic, 14, qryTaxaContribPartic.FieldByName('VALORBASE1').asFloat);

          14: if not qryTaxaContribPartic.FieldByName('VALORBASE1').isNull then
               InsereTipoValor(Versao, Partic, 14, qryTaxaContribPartic.FieldByName('VALORBASE1').asFloat);

          344: if not qryTaxaContribPartic.FieldByName('VALORBASE1').isNull then
               InsereTipoValor(Versao, Partic, 13, qryTaxaContribPartic.FieldByName('VALORBASE1').asFloat);

          352: if not qryTaxaContribPartic.FieldByName('VALORBASE1').isNull then
               InsereTipoValor(Versao, Partic, 17, qryTaxaContribPartic.FieldByName('VALORBASE1').asFloat);
        end; //case

        qryTaxaContribPartic.Next;
      end; //while

     qryTaxaContribPartic.Close;
     QryContribAssistido.Close;
     QryContribAssistido.ParamByName('plano').asInteger := Plano;
     QryContribAssistido.ParamByName('partic').asInteger := Partic;
     QryContribAssistido.Open;
     if not QryContribAssistido.FieldByName('VALORRECEBIDO').isNull then
       InsereTipoValor(Versao, Partic, 16, QryContribAssistido.FieldByName('VALORRECEBIDO').asFloat);
     QryContribAssistido.Close;


     //Quantidade de Cotas do Beneficio
     qryCotasBeneficio.Close;
     qryCotasBeneficio.ParamByName('patroc').asInteger := Patroc;
     qryCotasBeneficio.ParamByName('plano').asInteger := Plano;
     qryCotasBeneficio.ParamByName('partic').asInteger := Partic;
     qryCotasBeneficio.Open;
     if not qryCotasBeneficio.FieldByName('VALORATUAL').isNull then
       InsereTipoValor(Versao, Partic, 20, qryCotasBeneficio.FieldByName('VALORATUAL').asFloat);
     qryCotasBeneficio.Close;

     //Percentual de Resgate da Aposentoria
     QryResgateAposentadoria.Close;
     QryResgateAposentadoria.ParamByName('patroc').asInteger := Patroc;
     QryResgateAposentadoria.ParamByName('plano').asInteger := Plano;
     QryResgateAposentadoria.ParamByName('partic').asInteger := Partic;
     QryResgateAposentadoria.Open;
     if not QryResgateAposentadoria.FieldByName('VALORBASE1').isNull then
       InsereTipoValor(Versao, Partic, 21, QryResgateAposentadoria.FieldByName('VALORBASE1').asFloat);
     QryResgateAposentadoria.Close;
   end; //with
end;

procedure InsereTipoValor(Versao, Partic, Cod: Integer; Valor: Real);
begin
  with dtmImportacao do
   begin
    try
      qryInsValor.ParamByName('CD_PARTIC').asInteger := Partic;
      qryInsValor.ParamByName('CD_TIPO_VALOR').asInteger := Cod;
      qryInsValor.ParamByName('CD_VERSAO').asInteger := Versao;
      qryInsValor.ParamByName('VL_PARTICIPANTE').asFloat := Valor;
      qryInsValor.ExecSQL;
     except
      qryUpdValor.ParamByName('CD_PARTIC').asInteger := Partic;
      qryUpdValor.ParamByName('CD_TIPO_VALOR').asInteger := Cod;
      qryUpdValor.ParamByName('CD_VERSAO').asInteger := Versao;
      qryUpdValor.ParamByName('VL_PARTICIPANTE').asFloat := Valor;
      qryUpdValor.ExecSQL;
     end;
    end; 
end;

end.
