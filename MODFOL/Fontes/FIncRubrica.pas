unit FIncRubrica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSelPessoal, DBTables, Wwquery, Db, Wwtable, Wwdatsrc, MAHlpBtn,
  StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls, TB97, ComCtrls,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmIncRubrica = class(TfrmSelPessoal)
    qryProxSeq: TwwQuery;
    qryHstRub: TwwQuery;
    updHstRub: TUpdateSQL;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure qryHstRubBeforeInsert(DataSet: TDataSet);
    procedure qryHstRubAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIncRubrica: TfrmIncRubrica;

implementation

uses uMensErro, uSistema, uCalcRub, fAguarde, fLancaRub;

{$R *.DFM}

procedure TfrmIncRubrica.FormCreate(Sender: TObject);
begin
  inherited;
  qryHstRub.Open;
end;

procedure TfrmIncRubrica.qryHstRubBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  qryProxSeq.SQL.Clear;
  qryProxSeq.SQL.Add('SELECT MAX(SEQRUBRICAINDIV)+1 AS PROXNUM FROM RUBRICAINDIV');
  qryProxSeq.SQL.Add('WHERE (IDPESSOA  = ' + tblPessoal.FieldByName('IDPESSOA').asString+ ') AND');
  qryProxSeq.SQL.Add('      (IDRUBRICA = ' + IntToStr(frmLancaRub.iCodBen)+ ') AND');
  qryProxSeq.SQL.Add('      (IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa)+ ')');
  qryProxSeq.Open;

  if (qryProxSeq.FieldByName('PROXNUM').IsNull) then
    frmLancaRub.iProxSeq := 1
  else
    frmLancaRub.iProxSeq := qryProxSeq.FieldByName('PROXNUM').asInteger;

  qryProxSeq.Close;
end;

procedure TfrmIncRubrica.qryHstRubAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryHstRub.FieldByName('SEQRUBRICAINDIV').asInteger := frmLancaRub.iProxSeq;
end;

procedure TfrmIncRubrica.bbtnConfirmarClick(Sender: TObject);
var
  bErro, bFaz: boolean;
begin
  inherited;
  // Oculto o Form
  Self.Hide;

  frmLancaRub.Repaint;
  frmAguarde.Mostra('Incluindo Benefícios...');

  try
    tblPessoal.First;
    while not(tblPessoal.EOF) do
    begin
      frmLancaRub.dValCalc1 := 0;
      frmLancaRub.dValCalc2 := 0;

      qryHstRub.Locate('IDPESSOA;IDEMPRESA;IDRUBRICA',
        VarArrayOf([tblPessoal.FieldByName('IDPESSOA').asFloat, Sistema.IdEmpresa,
        frmLancaRub.iCodBen]),[loPartialKey]);

      bFaz := true;
      while (qryHstRub.FieldByName('IDPESSOA').asFloat =
             tblPessoal.FieldByName('IDPESSOA').asFloat) and
            (qryHstRub.FieldByName('IDEMPRESA').asInteger = Sistema.IdEmpresa) and
            (qryHstRub.FieldByName('IDRUBRICA').asInteger = frmLancaRub.iCodBen) do
      begin
        if (qryHstRub.FieldByName('NUMOCORRENCIAS').asInteger <
            qryHstRub.FieldByName('PARCELAS').asInteger) or
           (qryHstRub.FieldByName('FLGPERMANENTE').asInteger = 1) then
        begin
          bFaz := false;
          break;
        end;
        qryHstRub.Next;
      end;

      if (bFaz) then
      begin
        qryHstRub.Insert;
        qryHstRub.FieldByName('ANOMESINICIO').asString     := frmLancaRub.sAnoMesSel;
        qryHstRub.FieldByName('IDEMPRESA').asInteger       := Sistema.IdEmpresa;
        qryHstRub.FieldByName('PARCELAS').asString         := frmLancaRub.sNumParc;
        qryHstRub.FieldByName('IDRUBRICA').asInteger       := frmLancaRub.iCodBen;
        qryHstRub.FieldByName('FLGPERMANENTE').asInteger   := frmLancaRub.iFlgPerm;
        qryHstRub.FieldByName('SEQRUBRICAINDIV').asInteger := frmLancaRub.iProxSeq;
        qryHstRub.FieldbyName('IDREGRACALCULO').asString   := frmLancaRub.sCodRegra;
        qryHstRub.FieldbyName('FLGTPRUBMANUT').asInteger   := 2;
        qryHstRub.FieldbyName('NUMOCORRENCIAS').asInteger  := frmLancaRub.iQtdOcor;
        qryHstRub.FieldByName('IDPESSOA').asFloat := tblPessoal.FieldByName('IDPESSOA').asFloat;

        if (frmLancaRub.sValFun <> '') then
          qryHstRub.FieldByName('VALORRUBRICA').asString := frmLancaRub.sValFun
        else
          qryHstRub.FieldByName('VALORRUBRICA').Clear;

        qryHstRub.Post;
        qryHstRub.ApplyUpdates;
        qryHstRub.CommitUpdates;

        if not(frmLancaRub.bGravou) then
        begin
          frmLancaRub.bGravou   := true;
          frmLancaRub.iIDPessoa := StrToIntDef(tblPessoal.FieldByName('IDPESSOA').asString,0);
        end;
      end;
      tblPessoal.Next;
    end;

    bErro := false;
  except
    bErro := true;
  end;

  frmAguarde.Apaga;

  if not(bErro) then
    MsgDlg('Processo executado com sucesso!','Aviso',mtInformation,[mbOk,mbHelp],0)
  else
    MsgDlg('Ocorreu um erro na execução do Processo para o Empregado '+
      tblPessoal.FieldByName('NOME').asString +' !',
      'Erro', mtInformation,[mbOk,mbHelp],0);
end;

end.
