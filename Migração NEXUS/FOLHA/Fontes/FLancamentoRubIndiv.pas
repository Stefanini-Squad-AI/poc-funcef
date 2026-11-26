// *************************************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ********************************************
// *************************************************************************************************
// Autor(a)    : Paulo Ramos
// Data        : 13/11/2006
// Rotina      : ProcessaRetornos
// Pendência   : 21559
// Descricao   : Gravar o campo IdSeqInternoFB na inclusão de registros na RUBRICAINDIV.
//------------------------------------------------------------------------------
//  Autor(a)   : Paulo Ramos
//  Rotina     : MontaListaPessoas
//  Data       : 08/11/2006
//  Pendencia  : sem pendencia
//  Alteração  : Retirar order by da consulta que busca as pessoas
// -------------------------------------------------------------------------------------------------
//  Autor(a)   : Paulo Ramos
//  Rotina     : Processar
//  Data       : 08/11/2006
//  Pendencia  : 23387
//  Alteração  : Ajuste na forma como o sequence é obtido, alterando a consulta 
//    na Rubrica Individual, pelo plano contábil.
// -------------------------------------------------------------------------------------------------
//  Autor(a)   : Paulo Ramos
//  Rotina     : MontaListaPessoas e Processar
//  Data       : 09/10/2006
//  Pendencia  : 23496
//  Alteração  : Alterar a forma como monta as pessoas para serem selecionadas
//    para a rotina de criação da Rubrica Individual, de forma a evitar o uso
//    da cláusula IN, visto que limita a quantidade de pessoas que estão sendo
//    processadas a no máximo 1000.
//    O componente chklstPessoas foi substituído por um dbgrid.
// -------------------------------------------------------------------------------------------------
//  Autor(a)   : Paulo Ramos
//  Rotina     : Processar
//  Data       : 09/10/2006
//  Pendencia  : 23387
//  Alteração  : Gravar plano contábil do adiantamento gerado na Rubrica Individual
// -------------------------------------------------------------------------------------------------
//  Autor(a)   : Bruno Bastos
//  Rotina     : MontaListaPessoas
//  Data       : 08/12/2005
//  Pendencia  : 20993
//  Alteração  : Tirei o rule da query na MontaListaPessoas;
// -------------------------------------------------------------------------------------------------
//  Autor(a)   : Paulo Ramos
//  Rotina     : Várias
//  Data       : 21.11.2005
//  Pendencia  : 20732
//  Alteração  : Caso se defina uma regra, o lançamento da rubrica individual
//               é realizado com controle de saldo.
// -------------------------------------------------------------------------------------------------
unit FLancamentoRubIndiv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ComCtrls, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook, CheckLst, Db, DBTables,
  Wwquery, uFuncoesFolha, uObjFolha, uMensErro, dBaseDados, fAguarde,
  uCmSqlParams, DBClient, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, UConstFolha,
  uDatabase;

type
  TFrmLancamentoRubIndiv = class(TfrmOkCancelar)
    pnlMesCobeVersao: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cmbMesCob: TComboBox;
    edtAnoCob: TEdit;
    UpDown1: TUpDown;
    GroupBox3: TGroupBox;
    chklstVersao: TCheckListBox;
    pnlPessoas: TPanel;
    grbPessoas: TGroupBox;
    lblRubrica: TLabel;
    dblkRubrica: TwwDBLookupCombo;
    grbAnoMesDesconto: TGroupBox;
    Label3: TLabel;
    cmbMesDesconto: TComboBox;
    Label4: TLabel;
    edtAnoDesconto: TEdit;
    UpDown2: TUpDown;
    qryAux_ELIMINAR: TwwQuery;
    qryRubrica: TwwQuery;
    btnMostraPessoa: TButton;
    qryBuscaRubIndiv: TwwQuery;
    qryInsereRubIndiv: TwwQuery;
    chkMarcaTudo: TCheckBox;
    qryRegra: TwwQuery;
    lblRegraPA: TLabel;
    dblcRegra: TwwDBLookupCombo;
    dbgLancamento: TwwDBGrid;
    dsLancamento: TwwDataSource;
    cdsLancamento: TClientDataSet;
    cmsqlLancamento: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure cmbMesCobChange(Sender: TObject);
    procedure edtAnoCobChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnMostraPessoaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure chkMarcaTudoClick(Sender: TObject);
    procedure chklstVersaoClickCheck(Sender: TObject);
  private
    { Private declarations }
    wDia, wMes, wAno : Word;
    sVersaoSel,
    //sPessoaSel, //P.RAMOS-09/10/2006-PEND.23946
    sMesRef, sMesDesc : String;
    ListaVersao{, ListaPessoa - P.RAMOS-09/10/2006-PEND.23946} : TStringList;
    procedure MontaListaVersao;
    procedure MontaListaPessoas;
    procedure MontaQryRubrica;
    procedure Processar;
  public
    { Public declarations }
  end;

var
  FrmLancamentoRubIndiv: TFrmLancamentoRubIndiv;

implementation

{$R *.DFM}

procedure TFrmLancamentoRubIndiv.MontaListaVersao;
Var
  sSql : String;

begin
  If Trim(edtAnoCob.Text) <> '' Then
    sMesRef := edtAnoCob.Text;

  If cmbMesCob.ItemIndex < 9 Then
    sMesRef := sMesRef + '/0' + IntToStr(cmbMesCob.ItemIndex + 1)
  Else
    sMesRef := sMesRef + '/' + IntToStr(cmbMesCob.ItemIndex + 1);

  sSql := ' SELECT IDHSTFOLHABENEF, HISTORICO FROM HSTFOLHABENEF '+
          ' WHERE FLGTIPOFOLHA = 2 AND MESREFERENCIA = '+QuotedStr(sMesRef)+
          ' ORDER BY IDHSTFOLHABENEF ';

  qryAux_ELIMINAR.Close; //P.RAMOS-09/10/2006
  qryAux_ELIMINAR.Sql.Clear;
  qryAux_ELIMINAR.Sql.Add(sSql);
  qryAux_ELIMINAR.Open;
  qryAux_ELIMINAR.First;
  chklstVersao.Items.Clear;
  ListaVersao.Clear;
  While Not qryAux_ELIMINAR.eof Do
  Begin
    chklstVersao.Items.Add(qryAux_ELIMINAR.FieldByName('IDHSTFOLHABENEF').AsString+' - '+
                           qryAux_ELIMINAR.FieldByName('HISTORICO').AsString);
    ListaVersao.Add(qryAux_ELIMINAR.FieldByName('IDHSTFOLHABENEF').AsString);
    qryAux_ELIMINAR.Next;
  End;
end;

procedure TFrmLancamentoRubIndiv.FormCreate(Sender: TObject);
begin
  inherited;
  DecodeDate(Date, wAno, wMes, wDia);
  ListaVersao         := TStringList.Create;
  //ListaPessoa         := TStringList.Create; //P.RAMOS-09/10/2006-PEND.23946
end;

procedure TFrmLancamentoRubIndiv.cmbMesCobChange(Sender: TObject);
begin
  inherited;
  MontaListaVersao;
end;

procedure TFrmLancamentoRubIndiv.edtAnoCobChange(Sender: TObject);
begin
  inherited;
  MontaListaVersao;
end;

procedure TFrmLancamentoRubIndiv.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ListaVersao.Free;
  //ListaPessoa.Free; //P.RAMOS-09/10/2006-PEND.23946
end;

procedure TFrmLancamentoRubIndiv.btnMostraPessoaClick(Sender: TObject);
begin
  inherited;
  chkMarcaTudo.Checked := False;
  MontaFiltroCompleto(chklstVersao, ListaVersao, sVersaoSel);
  If Trim(sVersaoSel) = '' Then
  Begin
    MsgDlg('Escolha ao menos uma versão de pagamento.', 'Informação', mtInformation, [mbOk], 0);
    Exit;
  End
  Else
    MontaListaPessoas;
end;

procedure TFrmLancamentoRubIndiv.MontaListaPessoas;
var sSql: String;
begin
  //P.RAMOS-09/10/2006-PEND.23946-OTIMIZAR PARA LISTA DE PESSOAS
  //PEND.23387-INCLUIR PLANO CONTABIL
//  sSql := ' SELECT DISTINCT E.MATRICULA||'' - ''||D.MATRICULA||'' -  ''||TRIM(P.NOME)||'' - R$''||TO_CHAR(L.LIQ, ''999G999D99'') AS PESSOA, '+
//          ' L.LIQ, TRIM(P.NOME) AS NOME, H.IDRESPONSAVEL, H.IDTITULAR, H.IDPATRO, H.IDPESSJUR '+
//          ' FROM HISTRUBSAL H, PESSOA P, DEPENTIT D, ELEGPATRO E, '+
//              //Bruno Bastos - Pend. 20993 - 08/12/2005 - ' (SELECT /*+ RULE */ DISTINCT '+
//              ' (SELECT DISTINCT '+ //Bruno Bastos - Pend. 20993 - 08/12/2005
//                  ' H.IDTITULAR, '+
//                  ' H.IDRESPONSAVEL, '+
////                  ' SUM(DECODE(PD.FLGDESCONTO,0,H.VALORPROVENTO,0) - '+
////                  '     DECODE(PD.FLGDESCONTO,1,H.VALORPROVENTO,0)) AS LIQ '+
//                  ' SUM(DECODE(PD.FLGESPECIAL,0, '+
//                  ' DECODE(PD.FLGDESCONTO,0,H.VALORPROVENTO, 1,(-1)*H.VALORPROVENTO, 0), 0)) AS LIQ '+
//
//              '  FROM HISTRUBSAL H, PROVDESC PD WHERE ';
//
//  If Pos(',', sVersaoSel) > 0 Then
//    sSql := sSql + ' H.IDHSTFOLHABENEF IN ('+sVersaoSel+') AND '
//  Else
//    sSql := sSql + ' H.IDHSTFOLHABENEF = ('+sVersaoSel+') AND ';
//
//  sSql := sSql +
//    ' (H.FLGESTORNO IS NOT NULL OR H.FLGESTORNO = 0) AND '+
//    ' H.IDRUBRICA = PD.IDPROVENTO'+
//    ' AND H.IDMODULO = 18 '+ //Bruno Bastos - Pend. 19958 - 12/08/2005
//
//   ' GROUP BY '+
//     ' H.IDTITULAR, H.IDRESPONSAVEL) L WHERE ';
//
//  If Pos(',', sVersaoSel) > 0 Then
//    sSql := sSql + ' H.IDHSTFOLHABENEF IN ('+sVersaoSel+') AND'
//  Else
//    sSql := sSql + ' H.IDHSTFOLHABENEF = ('+sVersaoSel+') AND ';
//
//  sSql := sSql +
//          ' (H.FLGESTORNO IS NOT NULL OR H.FLGESTORNO = 0) AND '+
//          '  H.IDPESSOA = P.IDPESSOA AND '+
//          ' H.IDRESPONSAVEL = D.IDPESSOA(+) AND '+
//          ' H.IDTITULAR = E.IDPESSOA AND '+
//          ' H.IDPATRO = E.IDPESSJUR AND '+
//          ' H.IDRESPONSAVEL = L.IDRESPONSAVEL AND '+
//          ' H.IDTITULAR = L.IDTITULAR '+
//          ' AND H.IDMODULO = 18 '; //Bruno Bastos - Pend. 19958 - 12/08/2005
  ssql:=
    'SELECT 0 AS SEL, MATTIT, MATDEP, NOME, '+_clinefeed+
    '        LIQ, IDRESPONSAVEL, IDTITULAR, IDPATRO, IDPESSJUR, IDPLANOCONTABIL '+_clinefeed+
    'FROM ( '+_clinefeed+
    'SELECT DISTINCT E.MATRICULA AS MATTIT, D.MATRICULA AS MATDEP, P.NOME, '+_clinefeed+
    '       L.LIQ, L.IDRESPONSAVEL, L.IDTITULAR, L.IDPATRO, L.IDPESSJUR, L.IDPLANOCONTABIL '+_clinefeed+
    'FROM PESSOA P, DEPENTIT D, ELEGPATRO E, '+_clinefeed+
    '     (SELECT H.IDTITULAR,  H.IDRESPONSAVEL, H.IDPLANOCONTABIL, H.IDPATRO, H.IDPESSJUR, '+_clinefeed+
    '             SUM(DECODE(H.FLGESPECIAL,0, '+_clinefeed+
    '                 DECODE(H.FLGDESCONTO,0,H.VALORPROVENTO, 1,(-1)*H.VALORPROVENTO, 0), 0)) AS LIQ '+_clinefeed+
    '      FROM HISTRUBSAL H '+_clinefeed;
  if Pos(',', sVersaoSel) > 0 then
    ssql:=ssql+'WHERE H.IDHSTFOLHABENEF IN ('+sVersaoSel+') '+_clinefeed
  else
    ssql:=ssql+'WHERE H.IDHSTFOLHABENEF = ('+sVersaoSel+') '+_clinefeed;
  ssql:=ssql+
    '      AND (H.FLGESTORNO IS NOT NULL OR H.FLGESTORNO = 0) '+_clinefeed+
    '      AND H.IDMODULO = 18 '+_clinefeed+
    '      GROUP BY  H.IDTITULAR, H.IDRESPONSAVEL, H.IDPLANOCONTABIL, H.IDPATRO, H.IDPESSJUR) L '+_clinefeed+
    'WHERE L.IDRESPONSAVEL = D.IDPESSOA(+) '+_clinefeed+
    'AND L.IDTITULAR = D.IDTITULAR(+) '+_clinefeed+
    'AND L.IDRESPONSAVEL = P.IDPESSOA '+_clinefeed+
    'AND L.IDTITULAR = E.IDPESSOA '+_clinefeed+
    'AND L.IDPATRO = E.IDPESSJUR '+_clinefeed+
    ') '+_clinefeed;
//    'ORDER BY MATDEP '+_clinefeed; //P.RAMOS-08/11/2006

  cmsqlLancamento.Sql.Clear;
  cmsqlLancamento.Sql.Add(sSql);
  cmsqlLancamento.Open;

//  chklstPessoas.Items.Clear;
//  ListaPessoa.Clear;
//  While Not qryAux.eof Do
//  Begin
//    chklstPessoas.Items.Add(qryAux.FieldByName('PESSOA').AsString);
//    ListaPessoa.Add(qryAux.FieldByName('IDRESPONSAVEL').AsString);
//    qryAux.Next;
//  End;
  //P.RAMOS-09/10/2006-PEND.23946-OTIMIZAR PARA LISTA DE PESSOAS-FIM
end;

procedure TFrmLancamentoRubIndiv.FormShow(Sender: TObject);
begin
  inherited;
  cmbMesCob.ItemIndex      := wMes - 1;
  cmbMesDesconto.ItemIndex := wMes - 1;
  edtAnoCob.Text           := IntToStr(wAno);
  edtAnoDesconto.Text      := IntToStr(wAno);
  MontaListaVersao;
  MontaQryRubrica;
end;

procedure TFrmLancamentoRubIndiv.MontaQryRubrica;
begin
  qryRubrica.Sql.Clear;
  If SistemaFolha.FlgUsaCodRubExt = 1 Then
    qryRubrica.Sql.Add(' SELECT IDPROVENTO, CODPROVDESC||'' - ''||DESCRPROVDESC AS DESCRICAO '+
                       ' FROM PROVDESC '+
                       ' WHERE FLGDESCONTO = 1 AND CODPROVDESC IS NOT NULL ')
  Else
    qryRubrica.Sql.Add(' SELECT IDPROVENTO, IDPROVENTO||'' - ''||DESCRICAO AS DESCRICAO '+
                       ' FROM PROVDESC '+
                       ' WHERE FLGDESCONTO = 1 ');
  qryRubrica.Open;
  qryRegra.open; //P.RAMOS-PEND.20732-21.11.2005
end;

procedure TFrmLancamentoRubIndiv.bbtnConfirmarClick(Sender: TObject);
var bMarcado: boolean;
begin
  inherited;
  //MontaFiltroCompleto(chklstPessoas, ListaPessoa, sPessoaSel); //P.RAMOS-09/10/2006-PEND.23946
  If Trim(sVersaoSel) = '' Then
  Begin
    MsgDlg('Escolha ao menos uma versão de pagamento.', 'Informação', mtInformation, [mbOk], 0);
    Exit;
  End;
  //P.RAMOS-09/10/2006-PEND.23946-VERIFICA SE EXISTE ALGUÉM SELECIONADO
  bMarcado:=false;
  cdsLancamento.DisableControls;
  cdsLancamento.first;
  while not cdsLancamento.eof do
  begin
    if cdsLancamento.FieldByName('SEL').asinteger = 1 then
    begin
      bMarcado:=true;
      break;
    end;
    cdsLancamento.Next;
  end;
//  If Trim(sPessoaSel) = '' Then
  if not bmarcado then
  begin
    MsgDlg('Escolha ao menos uma pessoa para lançar o desconto.',
      'Informação', mtInformation, [mbOk], 0);
    Exit;
  end;
  cdsLancamento.EnableControls;
  //P.RAMOS-09/10/2006-PEND.23946-VERIFICA SE EXISTE ALGUÉM SELECIONADO-FIM
  If Trim(dblkRubrica.Text) = '' Then
  Begin
    MsgDlg('Escolha a rubrica ser descontada o valor.', 'Informação', mtInformation, [mbOk], 0);
    Exit;
  End;
//P.RAMOS-06.10.2004-PEND.17883
//  If cmbMesCob.ItemIndex < 9 Then
  If cmbMesDesconto.ItemIndex < 9 Then
//P.RAMOS-06.10.2004-PEND.17883-ATÉ AQUI
    sMesDesc := '/0' + IntToStr(cmbMesDesconto.ItemIndex + 1)
  Else
    sMesDesc := '/' + IntToStr(cmbMesDesconto.ItemIndex + 1);

  If Trim(edtAnoDesconto.Text) <> '' Then
    sMesDesc := sMesDesc + '/' + edtAnoDesconto.Text;
  Processar;
end;

procedure TFrmLancamentoRubIndiv.Processar;
Var
  sDataInicio : String;
  bInsere     : Boolean;
  iCont       : Integer;
begin
  frmAguarde.Mostra('Aguarde. Gerando Desconto.');
  If Not dtmBaseDados.dbBaseDados.InTransaction Then
    dtmBaseDados.dbBaseDados.StartTransaction;

//P.RAMOS-09/10/2006-PEND.23946-OTIMIZAR PARA LISTA DE PESSOAS
//PEND.23387-INCLUIR PLANO CONTABIL
//ALTERAÇÃO DE QRYAUX PARA CDSLANCAMENTO
//  qryAux.Close;
//  If sPessoaSel <> '' Then
//    If Pos(',', sPessoaSel) > 0 Then
//      qryAux.Sql.Add(' AND H.IDRESPONSAVEL IN ('+sPessoaSel+')')
//    Else
//      qryAux.Sql.Add(' AND H.IDRESPONSAVEL = ('+sPessoaSel+')');
//  qryAux.Open;
  sMesDesc := '01'+sMesDesc;

  cdsLancamento.DisableControls;
  cdsLancamento.first;
  //While Not qryAux.Eof Do
  while not cdsLancamento.eof do
  begin
    if cdsLancamento.FieldByName('SEL').asinteger = 1 then
    begin
      qryBuscaRubIndiv.Close;
      qryBuscaRubIndiv.ParamByName('PIDPESSOA').AsInteger:=
        //qryAux.FieldByName('IDRESPONSAVEL').AsInteger;
        cdsLancamento.FieldByName('IDRESPONSAVEL').AsInteger;
      qryBuscaRubIndiv.ParamByName('PIDEMPRESA').AsInteger:=
        //qryAux.FieldByName('IDPESSJUR').AsInteger;
        cdsLancamento.FieldByName('IDPESSJUR').AsInteger;
      qryBuscaRubIndiv.ParamByName('PIDRUBRICA').AsInteger:=
        StrToInt(dblkRubrica.LookupValue);
//P.RAMOS-08/11/2006-PEND.23387-RETIRAR PLANO CONTABIL DA CONSULTA
//      qryBuscaRubIndiv.ParamByName('PIDPLANOCONTABIL').AsInteger:=
//        cdsLancamento.FieldByName('IDPLANOCONTABIL').AsInteger; //P.RAMOS-11/10/2006-PEND.23387-INCLUIR PLANO CONTABIL
//P.RAMOS-08/11/2006-PEND.23387-RETIRAR PLANO CONTABIL DA CONSULTA-FIM
      qryBuscaRubIndiv.Open;
      bInsere := True;
      iCont   := 0;
      While Not qryBuscaRubIndiv.Eof Do
      Begin
        If (not bInsere) and (iCont > 0) Then
        Begin
          qryBuscaRubIndiv.Next;
          Continue;
        End
        Else
          //P.RAMOS-08/11/2006-PEND.23387-INCLUIR PLANO CONTABIL
          if (qryBuscaRubIndiv.FieldByName('IDPLANOCONTABIL').AsInteger <>
              cdsLancamento.FieldByName('IDPLANOCONTABIL').AsInteger) then
            bInsere := True
          else
          //P.RAMOS-08/11/2006-PEND.23387-INCLUIR PLANO CONTABIL-FIM
          If (qryBuscaRubIndiv.FieldByName('NUMOCORRENCIAS').AsInteger =
              qryBuscaRubIndiv.FieldByName('PARCELAS').AsInteger) And
             (qryBuscaRubIndiv.FieldByName('FLGUSADO').AsInteger = 1) Then
            bInsere := True
          Else
            If (qryBuscaRubIndiv.FieldByName('ANOMESREF').AsString <> sMesRef) Then
              bInsere := True
            Else
              bInsere := False;
        Inc(iCont);
        qryBuscaRubIndiv.Next;
      end;
      if bInsere then
      begin
        qryInsereRubIndiv.Close;
        qryInsereRubIndiv.ParamByName('PIDPESSOA').AsInteger:=
          //qryAux.FieldByName('IDRESPONSAVEL').AsInteger;
          cdsLancamento.FieldByName('IDRESPONSAVEL').AsInteger;
        qryInsereRubIndiv.ParamByName('PIDEMPRESA').AsInteger:=
          //qryAux.FieldByName('IDPESSJUR').AsInteger;
          cdsLancamento.FieldByName('IDPESSJUR').AsInteger;
        qryInsereRubIndiv.ParamByName('PIDRUBRICA').AsInteger:=
          StrToInt(dblkRubrica.LookupValue);
        //Bruno Bastos - 11/05/2004 - qryInsereRubIndiv.ParamByName('PSEQRUBRICAINDIV').AsInteger := qryBuscaRubIndiv.FieldByName('SEQRUBRICAINDIV').AsInteger+1;
        qryInsereRubIndiv.ParamByName('PSEQRUBRICAINDIV').AsInteger:=
          qryBuscaRubIndiv.FieldByName('MAXSEQ').AsInteger+1;//Bruno Bastos - 11/05/2004
        qryInsereRubIndiv.ParamByName('PVALORRUBRICA').AsFloat:=
          //qryAux.FieldByName('LIQ').AsFloat;
          cdsLancamento.FieldByName('LIQ').AsFloat;
        qryInsereRubIndiv.ParamByName('PANOMESREF').AsString:=sMesRef;
        qryInsereRubIndiv.ParamByName('PIDTITULAR').AsInteger:=
          //qryAux.FieldByName('IDTITULAR').AsInteger;
          cdsLancamento.FieldByName('IDTITULAR').AsInteger;
        qryInsereRubIndiv.ParamByName('PDATAINICIO').AsString:=sMesDesc;
        //P.RAMOS-PEND.20732-21.11.2005
        if trim(dblcRegra.text) <> '' then
        begin
          qryInsereRubIndiv.ParamByName('PFLGPERMANENTE').asinteger:=1;
          qryInsereRubIndiv.ParamByName('PPARCELAS').asinteger:=0;
          qryInsereRubIndiv.ParamByName('PIDREGRACALCULO').asinteger:=
            qryRegra.fieldbyname('IDREGRA').asinteger;
          qryInsereRubIndiv.ParamByName('PFLGCONTROLASALDO').asinteger:=1;
          qryInsereRubIndiv.ParamByName('PVLRSALDOINICIAL').asfloat:=
            //qryAux.FieldByName('LIQ').AsFloat;
            cdsLancamento.FieldByName('LIQ').AsFloat;
          qryInsereRubIndiv.ParamByName('PVLRTOTALPROC').asfloat:=0;
        end
        else
        begin
          qryInsereRubIndiv.ParamByName('PFLGPERMANENTE').asinteger:=0;
          qryInsereRubIndiv.ParamByName('PPARCELAS').asinteger:=1;
          qryInsereRubIndiv.ParamByName('PIDREGRACALCULO').clear;
          qryInsereRubIndiv.ParamByName('PFLGCONTROLASALDO').clear;
          qryInsereRubIndiv.ParamByName('PVLRSALDOINICIAL').clear;
          qryInsereRubIndiv.ParamByName('PVLRTOTALPROC').clear;
        end;
        //P.RAMOS-PEND.20732-21.11.2005-FIM
        qryInsereRubIndiv.ParamByName('PIDPLANOCONTABIL').asinteger:=
          cdsLancamento.FieldByName('IDPLANOCONTABIL').AsInteger; //P.RAMOS-11/10/2006-PEND.23387-INCLUIR PLANO CONTABIL
        qryInsereRubIndiv.ParamByName('PIDSEQINTERNOFB').asinteger:=
          LeUltRegistro(nil, 'SEQINTERNOFB'); //P.RAMOS-13/11/2006-PEND.21559
        try
          qryInsereRubIndiv.Execsql;
          dtmBaseDados.dbBaseDados.Commit;
          dtmBaseDados.dbBaseDados.StartTransaction;
        except
          raise;
          exit;
        end;
      end;
    end;
    //qryAux.Next;
    cdsLancamento.Next;
  End;
  //P.RAMOS-11/10/2006-PEND.23387-INCLUIR PLANO CONTABIL
  cdsLancamento.EnableControls;
  if dtmBaseDados.dbBaseDados.inTransaction then
    dtmBaseDados.dbBaseDados.commit;
  //P.RAMOS-11/10/2006-PEND.23387-INCLUIR PLANO CONTABIL-FIM
//P.RAMOS-09/10/2006-PEND.23946-OTIMIZAR PARA LISTA DE PESSOAS-FIM
  frmAguarde.Apaga;
  ShowMessage('Geração de desconto efetuada com sucesso.');
  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled  := False;
end;

procedure TFrmLancamentoRubIndiv.chkMarcaTudoClick(Sender: TObject);
//Var i : Integer;
begin
  inherited;
//P.RAMOS-09/10/2006-PEND.23946-OTIMIZAR PARA LISTA DE PESSOAS
  //If qryAux.Active Then
  if cdsLancamento.active Then
  Begin
//    i := 0;
    cdsLancamento.DisableControls;
    //qryAux.First;
    cdsLancamento.first;
    //Bruno Bastos - Pend. 19958 - 12/08/2005 - Início
    { Coloquei a condição abaixo para verificar se marca/desmarca tudo }
    If not chkMarcaTudo.Checked Then
      //While Not qryAux.eof Do
      while not cdsLancamento.eof do
      begin
        //chklstPessoas.Checked[i] := False;
        //qryAux.Next;
        cdsLancamento.edit;
        cdsLancamento.fieldbyname('SEL').asinteger:=0;
        cdsLancamento.post;
        cdsLancamento.next;
        //inc(i);
      end
    else
      //While Not qryAux.eof Do
      while not cdsLancamento.eof do
      begin
        //chklstPessoas.Checked[i] := True;
        //qryAux.Next;
        cdsLancamento.edit;
        cdsLancamento.fieldbyname('SEL').asinteger:=1;
        cdsLancamento.post;
        cdsLancamento.next;
        //Inc(i);
      end;
    //Bruno Bastos - Pend. 19958 - 12/08/2005 - Fim
    cdsLancamento.enableControls;
  End;
//P.RAMOS-09/10/2006-PEND.23946-OTIMIZAR PARA LISTA DE PESSOAS-FIM
end;

procedure TFrmLancamentoRubIndiv.chklstVersaoClickCheck(Sender: TObject);
begin
  inherited;
//P.RAMOS-09/10/2006-PEND.23946
  //qryAux.Close;
  //ListaPessoa.Clear;
  //chklstPessoas.Items.Clear;
  cdsLancamento.close;
//P.RAMOS-09/10/2006-PEND.23946-FIM  
end;

end.
