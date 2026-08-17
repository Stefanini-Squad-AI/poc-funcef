{===============================================================================
Unit    :  uImportarVersaoBase
Form    :

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 08/09/2000

Objetivo: Procedimentos referentes à importação da Base de Trabalho
          para a Base de Histórico e vice-versa.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit uImportarVersaoBase;

interface

uses forms, comctrls;

var
    falhou, cancelado: Boolean; // Flag para verificar falha antes do COMMIT 

    procedure ImportaBaseHistorico(versao: Integer);
    procedure ImportaCalculo(versao: Integer);

    procedure RestauraBaseHistorico(versao_nova, patroc, entid,
                                    plano, versao_velha: Integer);
    procedure InsereParticipante(versao, entid, patroc, plano: Integer);
    procedure InsereDependente(versao: Integer);
    procedure InsereBeneficio(versao, entid, patroc, plano: Integer);
    procedure InsereValor(versao: Integer);
    procedure InsereTempo(versao: Integer);

var
  w_linhas, w_linha_atual : word;

implementation

uses FAnimacao, FCadVersaoBase, uDtmImportacaoBase, Dialogs, SysUtils;
  
//---------------------------------------------------------
//     Importar uma Versão para a Base de Histórico
//     excluindo a Versão da Base de Trabalho
//---------------------------------------------------------
procedure ImportaBaseHistorico(versao: Integer);
begin
  Application.CreateForm(TfrmAnimacao, frmAnimacao);
  w_linhas := 10; //Número de linhas (registros) do arquivo
  w_linha_Atual := 0;
  frmAnimacao.SetAnimacao('Transferindo Dados para Base de Histórico ...',
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
  with DtmImportacaoBase do
   begin
     try
      qryInsHistParticipante.ParamByName('CD_VERSAO').asInteger := versao;
      qryInsHistParticipante.ExecSQL;

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

      qryInsHistDependente.ParamByName('CD_VERSAO').asInteger := versao;
      qryInsHistDependente.ExecSQL;

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

      qryInsHistBeneficio.ParamByName('CD_VERSAO').asInteger := versao;
      qryInsHistBeneficio.ExecSQL;
      qryInsHistValor.ParamByName('CD_VERSAO').asInteger := versao;
      qryInsHistValor.ExecSQL;

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

      qryInsHistTempo.ParamByName('CD_VERSAO').asInteger := versao;
      qryInsHistTempo.ExecSQL;
     except
       falhou := true;
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

     ImportaCalculo(versao);

     if falhou then
       exit;

     try
      qryDelTempo.ParamByName('CD_VERSAO').asInteger := versao;
      qryDelTempo.ExecSQL;

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

      qryDelValor.ParamByName('CD_VERSAO').asInteger := versao;
      qryDelValor.ExecSQL;

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

      qryDelBeneficio.ParamByName('CD_VERSAO').asInteger := versao;
      qryDelBeneficio.ExecSQL;
      qryDelDependente.ParamByName('CD_VERSAO').asInteger := versao;
      qryDelDependente.ExecSQL;
      qryDelGrupoExportPartic.ParamByName('CD_VERSAO').asInteger := versao;
      qryDelGrupoExportPartic.ExecSQL;

      qryDelParticipante.ParamByName('CD_VERSAO').asInteger := versao;
      qryDelParticipante.ExecSQL;

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

      qryUpdVersaoH.ParamByName('CD_VERSAO').asInteger := versao;
      qryUpdVersaoH.ExecSQL;
     except
       falhou := true;
     end;
   end;
end;

procedure ImportaCalculo(versao: Integer);
begin
  with DtmImportacaoBase do
   begin
     try
      qryInsHistReferCalculo.ParamByName('CD_VERSAO').asInteger := versao;
      qryInsHistReferCalculo.ExecSQL;
      qryInsHistOcorCalculo.ParamByName('CD_VERSAO').asInteger := versao;
      qryInsHistOcorCalculo.ExecSQL;

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

      qryInsHistOpcaoCalculo.ParamByName('CD_VERSAO').asInteger := versao;
      qryInsHistOpcaoCalculo.ExecSQL;
     except
      begin
       falhou := true;
       exit;
      end;
     end;

     if falhou then
      exit;

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
      qryDelOpcaoCalculo.ParamByName('CD_VERSAO').asInteger := versao;
      qryDelOpcaoCalculo.ExecSQL;
      qryDelOcorCalculo.ParamByName('CD_VERSAO').asInteger := versao;
      qryDelOcorCalculo.ExecSQL;
      qryDelReferCalculo.ParamByName('CD_VERSAO').asInteger := versao;
      qryDelReferCalculo.ExecSQL;
     except
       falhou := true;
     end;
   end;
end;
//-/ Fim /-

//------------------------------------------------------------
//     Restaurar uma Versão da Base de Histórico
//     criando uma NOVA Versão na Base de Trabalho
//------------------------------------------------------------
procedure RestauraBaseHistorico(versao_nova, patroc, entid,
                                plano, versao_velha: Integer);
begin
  Application.CreateForm(TfrmAnimacao, frmAnimacao);
  w_linhas := 5; //Número de linhas (registros) do arquivo
  w_linha_Atual := 0;
  frmAnimacao.SetAnimacao('Restaurando Base de Histórico para a nova Versão ...',
                           w_linhas,True,True,aviCopyFiles);

  falhou := false;
  cancelado := false;
  with DtmImportacaoBase do
   begin
//início Participante
     try
      qryHistParticipante.Close;
      qryHistParticipante.ParamByName('CD_VERSAO').asInteger := versao_velha;
      qryHistParticipante.Open;

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

      if not(qryHistParticipante.isEmpty) then
        InsereParticipante(versao_nova, entid, patroc, plano);

      qryHistParticipante.Close;
     except
      begin
       falhou := true;
       qryHistParticipante.Close;
       frmCadVersaoBase.Close;
       exit;
      end;
     end;
//fim Participante

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
//início Dependente
      qryHistDependente.Close;
      qryHistDependente.ParamByName('CD_VERSAO').asinteger := versao_velha;
      qryHistDependente.Open;

      if not(qryHistDependente.isEmpty) then
        InsereDependente(versao_nova);

      qryHistDependente.Close;
//fim Dependente

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

//início Benefício
       qryHistBeneficio.Close;
       qryHistBeneficio.ParamByName('CD_VERSAO').asInteger := versao_velha;
       qryHistBeneficio.Open;

       if not(qryHistBeneficio.isEmpty) then
         InsereBeneficio(versao_nova, entid, patroc, plano);

       qryHistBeneficio.Close;
//fim Benefício

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

//início Valor
       qryHistValor.Close;
       qryHistValor.ParamByName('CD_VERSAO').asInteger := versao_velha;
       qryHistValor.Open;

       if not(qryHistValor.isEmpty) then
         InsereValor(versao_nova);

       qryHistValor.Close;
//fim Valor

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

//início Tempo
       qryHistTempo.Close;
       qryHistTempo.ParamByName('CD_VERSAO').asInteger := versao_velha;
       qryHistTempo.Open;

       if not(qryHistTempo.isEmpty) then
         InsereTempo(versao_nova);

       qryHistTempo.Close;
//fim Tempo
     except
      begin
       falhou := true;
       frmCadVersaoBase.Close;
       exit;
      end;
     end;
   end;// with DtmImportacaoBase
end;


procedure InsereParticipante(versao, entid, patroc, plano: Integer);
begin
  with DtmImportacaoBase do
  begin
   repeat
      if VarIsNull(qryHistParticipante.FieldByName('CD_ESTADO_CIVIL').Value) then
         qryInsParticipante.ParamByName('CD_ESTADO_CIVIL').Clear
      else
         qryInsParticipante.ParamByName('CD_ESTADO_CIVIL').Value :=
             qryHistParticipante.FieldByName('CD_ESTADO_CIVIL').Value;
      if VarIsNull(qryHistParticipante.FieldByName('CD_GRUPO_CALCULO').Value) then
        qryInsParticipante.ParamByName('CD_GRUPO_CALCULO').Clear
      else
       qryInsParticipante.ParamByName('CD_GRUPO_CALCULO').Value :=
             qryHistParticipante.FieldByName('CD_GRUPO_CALCULO').Value;

       qryInsParticipante.ParamByName('CD_PARTIC').Value :=
             qryHistParticipante.FieldByName('CD_PARTIC').Value;
     qryInsParticipante.ParamByName('CD_PESSOA_ENTID').asInteger := entid;
     qryInsParticipante.ParamByName('CD_PESSOA_PATROC').asInteger := patroc;
     qryInsParticipante.ParamByName('CD_PLANO').asInteger := plano;
     qryInsParticipante.ParamByName('CD_VERSAO').asInteger := versao;
      if VarIsNull(qryHistParticipante.FieldByName('CD_TIPO_CAT_PROF_ESP').Value) then
       qryInsParticipante.ParamByName('CD_TIPO_CAT_PROF_ESP').Clear
      else
       qryInsParticipante.ParamByName('CD_TIPO_CAT_PROF_ESP').Value :=
             qryHistParticipante.FieldByName('CD_TIPO_CAT_PROF_ESP').Value;
      if VarIsNull(qryHistParticipante.FieldByName('IR_CONDICAO_TRABALHO').Value) then
       qryInsParticipante.ParamByName('IR_CONDICAO_TRABALHO').Clear
      else
       qryInsParticipante.ParamByName('IR_CONDICAO_TRABALHO').Value :=
             qryHistParticipante.FieldByName('IR_CONDICAO_TRABALHO').Value;
      if VarIsNull(qryHistParticipante.FieldByName('IR_SEXO').Value) then
       qryInsParticipante.ParamByName('IR_SEXO').Clear
      else
       qryInsParticipante.ParamByName('IR_SEXO').Value :=
             qryHistParticipante.FieldByName('IR_SEXO').Value;
      if VarIsNull(qryHistParticipante.FieldByName('NR_MATRICULA').Value) then
       qryInsParticipante.ParamByName('NR_MATRICULA').Clear
      else
       qryInsParticipante.ParamByName('NR_MATRICULA').Value :=
             qryHistParticipante.FieldByName('NR_MATRICULA').Value;
      if VarIsNull(qryHistParticipante.FieldByName('NO_PESSOA').Value) then
       qryInsParticipante.ParamByName('NO_PESSOA').Clear
      else
       qryInsParticipante.ParamByName('NO_PESSOA').Value :=
             qryHistParticipante.FieldByName('NO_PESSOA').Value;
      if VarIsNull(qryHistParticipante.FieldByName('TP_PARTICIPANTE').Value) then
       qryInsParticipante.ParamByName('TP_PARTICIPANTE').Clear
      else
       qryInsParticipante.ParamByName('TP_PARTICIPANTE').Value :=
             qryHistParticipante.FieldByName('TP_PARTICIPANTE').Value;
      if VarIsNull(qryHistParticipante.FieldByName('DS_REGIONAL').Value) then
       qryInsParticipante.ParamByName('DS_REGIONAL').Clear
      else
       qryInsParticipante.ParamByName('DS_REGIONAL').Value :=
             qryHistParticipante.FieldByName('DS_REGIONAL').Value;
      if VarIsNull(qryHistParticipante.FieldByName('CD_SITUACAO_PATROC').Value) then
       qryInsParticipante.ParamByName('CD_SITUACAO_PATROC').Clear
      else
       qryInsParticipante.ParamByName('CD_SITUACAO_PATROC').Value :=
             qryHistParticipante.FieldByName('CD_SITUACAO_PATROC').Value;
      if VarIsNull(qryHistParticipante.FieldByName('CD_SITUACAO_FUNDACAO').Value) then
       qryInsParticipante.ParamByName('CD_SITUACAO_FUNDACAO').Clear
      else
       qryInsParticipante.ParamByName('CD_SITUACAO_FUNDACAO').Value :=
             qryHistParticipante.FieldByName('CD_SITUACAO_FUNDACAO').Value;
       qryInsParticipante.ParamByName('NR_CPF').Value :=
             qryHistParticipante.FieldByName('NR_CPF').Value;

     qryInsParticipante.ExecSQL;

     qryHistParticipante.Next;
   until qryHistParticipante.EOF;
  end;//with DtmImportacaoBase
end;

procedure InsereDependente(versao: Integer);
begin
  with DtmImportacaoBase do
  begin
   repeat
       qryInsDependente.ParamByName('CD_DEPENDENTE').Value :=
             qryHistDependente.FieldByName('CD_DEPENDENTE').Value;
      if VarIsNull(qryHistDependente.FieldByName('CD_DURACAO').Value) then
       qryInsDependente.ParamByName('CD_DURACAO').Clear
      else
       qryInsDependente.ParamByName('CD_DURACAO').Value :=
             qryHistDependente.FieldByName('CD_DURACAO').Value;
      if VarIsNull(qryHistDependente.FieldByName('CD_GRAU_DEPENDENCIA').Value) then
       qryInsDependente.ParamByName('CD_GRAU_DEPENDENCIA').Clear
      else
       qryInsDependente.ParamByName('CD_GRAU_DEPENDENCIA').Value :=
             qryHistDependente.FieldByName('CD_GRAU_DEPENDENCIA').Value;
      if VarIsNull(qryHistDependente.FieldByName('CD_GRAU_INSTRUCAO').Value) then
       qryInsDependente.ParamByName('CD_GRAU_INSTRUCAO').Clear
      else
       qryInsDependente.ParamByName('CD_GRAU_INSTRUCAO').Value :=
             qryHistDependente.FieldByName('CD_GRAU_INSTRUCAO').Value;

       qryInsDependente.ParamByName('CD_PARTIC').Value :=
             qryHistDependente.FieldByName('CD_PARTIC').Value;
       qryInsDependente.ParamByName('CD_VERSAO').asInteger := versao;

      if VarIsNull(qryHistDependente.FieldByName('DT_NASC').Value) then
       qryInsDependente.ParamByName('DT_NASC').Clear
      else
       qryInsDependente.ParamByName('DT_NASC').Value :=
             qryHistDependente.FieldByName('DT_NASC').Value;
      if VarIsNull(qryHistDependente.FieldByName('IR_E_TITULAR_PENSAO').Value) then
       qryInsDependente.ParamByName('IR_E_TITULAR_PENSAO').Clear
      else
       qryInsDependente.ParamByName('IR_E_TITULAR_PENSAO').Value :=
             qryHistDependente.FieldByName('IR_E_TITULAR_PENSAO').Value;
      if VarIsNull(qryHistDependente.FieldByName('IR_SEXO').Value) then
       qryInsDependente.ParamByName('IR_SEXO').Clear
      else
       qryInsDependente.ParamByName('IR_SEXO').Value :=
             qryHistDependente.FieldByName('IR_SEXO').Value;
      if VarIsNull(qryHistDependente.FieldByName('NR_ANOS_DEPENDENTE').Value) then
       qryInsDependente.ParamByName('NR_ANOS_DEPENDENTE').Clear
      else
       qryInsDependente.ParamByName('NR_ANOS_DEPENDENTE').Value :=
             qryHistDependente.FieldByName('NR_ANOS_DEPENDENTE').Value;
      if VarIsNull(qryHistDependente.FieldByName('NR_MATRICULA').Value) then
       qryInsDependente.ParamByName('NR_MATRICULA').Clear
      else
       qryInsDependente.ParamByName('NR_MATRICULA').Value :=
             qryHistDependente.FieldByName('NR_MATRICULA').Value;
      if VarIsNull(qryHistDependente.FieldByName('NO_DEPENDENTE').Value) then
       qryInsDependente.ParamByName('NO_DEPENDENTE').Clear
      else
       qryInsDependente.ParamByName('NO_DEPENDENTE').Value :=
             qryHistDependente.FieldByName('NO_DEPENDENTE').Value;

     qryInsDependente.ExecSQL;

     qryHistDependente.Next;
   until qryHistDependente.EOF;
  end;//with DtmImportacaoBase
end;

procedure InsereBeneficio(versao, entid, patroc, plano: Integer);
begin
  with DtmImportacaoBase do
  begin
   repeat
       qryInsBeneficio.ParamByName('CD_VERSAO').asInteger := versao;

       qryInsBeneficio.ParamByName('CD_PARTIC').Value :=
             qryHistBeneficio.FieldByName('CD_PARTIC').Value;

       qryInsBeneficio.ParamByName('CD_PESSOA_PATROC').asInteger := patroc;
       qryInsBeneficio.ParamByName('CD_PESSOA_ENTID').asInteger := entid;
       qryInsBeneficio.ParamByName('CD_PLANO').asInteger := plano;
      if VarIsNull(qryHistBeneficio.FieldByName('CD_TIPO_BENEF').Value) then
       qryInsBeneficio.ParamByName('CD_TIPO_BENEF').Clear
      else
       qryInsBeneficio.ParamByName('CD_TIPO_BENEF').Value :=
             qryHistBeneficio.FieldByName('CD_TIPO_BENEF').Value;

     qryInsBeneficio.ExecSQL;

     qryHistBeneficio.Next;
   until qryHistBeneficio.EOF;
  end;//with DtmImportacaoBase
end;

procedure InsereValor(versao: Integer);
begin
  with DtmImportacaoBase do
  begin
   repeat
       qryInsValor.ParamByName('CD_VERSAO').asInteger := versao;

       qryInsValor.ParamByName('CD_PARTIC').Value :=
             qryHistValor.FieldByName('CD_PARTIC').Value;
      if VarIsNull(qryHistValor.FieldByName('CD_TIPO_VALOR').Value) then
       qryInsValor.ParamByName('CD_TIPO_VALOR').Clear
      else
       qryInsValor.ParamByName('CD_TIPO_VALOR').Value :=
             qryHistValor.FieldByName('CD_TIPO_VALOR').Value;
      if VarIsNull(qryHistValor.FieldByName('VL_PARTICIPANTE').Value) then
       qryInsValor.ParamByName('VL_PARTICIPANTE').Clear
      else
       qryInsValor.ParamByName('VL_PARTICIPANTE').Value :=
             qryHistValor.FieldByName('VL_PARTICIPANTE').Value;

     qryInsValor.ExecSQL;

     qryHistValor.Next;
   until qryHistValor.EOF;
  end;//with DtmImportacaoBase
end;

procedure InsereTempo(versao: Integer);
begin
  with DtmImportacaoBase do
  begin
   repeat
       qryInsTempo.ParamByName('CD_VERSAO').asInteger := versao;
       qryInsTempo.ParamByName('CD_PARTIC').Value :=
             qryHistTempo.FieldByName('CD_PARTIC').Value;
      if VarIsNull(qryHistTempo.FieldByName('CD_TIPO_TEMPO').Value) then
       qryInsTempo.ParamByName('CD_TIPO_TEMPO').Clear
      else
       qryInsTempo.ParamByName('CD_TIPO_TEMPO').Value :=
             qryHistTempo.FieldByName('CD_TIPO_TEMPO').Value;
      if VarIsNull(qryHistTempo.FieldByName('DT_TEMPO').Value) then
       qryInsTempo.ParamByName('DT_TEMPO').Clear
      else
       qryInsTempo.ParamByName('DT_TEMPO').Value :=
             qryHistTempo.FieldByName('DT_TEMPO').Value;
      if VarIsNull(qryHistTempo.FieldByName('QT_DIA_TEMPO').Value) then
       qryInsTempo.ParamByName('QT_DIA_TEMPO').Clear
      else
       qryInsTempo.ParamByName('QT_DIA_TEMPO').Value :=
             qryHistTempo.FieldByName('QT_DIA_TEMPO').Value;
      if VarIsNull(qryHistTempo.FieldByName('QT_MES_TEMPO').Value) then
       qryInsTempo.ParamByName('QT_MES_TEMPO').Clear
      else
       qryInsTempo.ParamByName('QT_MES_TEMPO').Value :=
             qryHistTempo.FieldByName('QT_MES_TEMPO').Value;
      if VarIsNull(qryHistTempo.FieldByName('QT_ANO_TEMPO').Value) then
       qryInsTempo.ParamByName('QT_ANO_TEMPO').Clear
      else
       qryInsTempo.ParamByName('QT_ANO_TEMPO').Value :=
             qryHistTempo.FieldByName('QT_ANO_TEMPO').Value;             

     qryInsTempo.ExecSQL;

     qryHistTempo.Next;
   until qryHistTempo.EOF;
  end;//with DtmImportacaoBase
end;
//-/ Fim /-

end.
