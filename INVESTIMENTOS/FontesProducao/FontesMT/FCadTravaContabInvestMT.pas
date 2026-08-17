//******************************************************************************
// Data     : 14/06/2006
// Código   : AL_1
// Pendencia: 20453
// SOL      : 33866
// Desc     : Implementação da Trava Contábil por Módulo
//******************************************************************************

unit FCadTravaContabInvestMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInv, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  fcLabel, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ExtCtrls, wwdblook, CMDBLookupCombo,
  wwdbdatetimepicker, CMDateTimePicker, uCmSqlParams, Menus, faMensagem,
  uCtrlInvContab, uCtrlPadroes, uCtrlInvestimento, uMensErro, uCMTypes,
  uCtrlRendaFixa;

type
  TFrmCadTravaContabInvest = class(TFrmCadastroGridMTInv)
    Label8: TLabel;
    dbdDataBloq: TCMDateTimePicker;
    dblTipoInvest: TCMDBLookupCombo;
    Label4: TLabel;
    lblClasse: TLabel;
    dblkClasseTit: TCMDBLookupCombo;
    CMSqlParams1: TCMSqlParams;
    dblkMercado: TCMDBLookupCombo;
    lblMercado: TLabel;
    CdsTipoInvest: TCMClientDataSet;
    CdsMercado: TCMClientDataSet;
    CdsClasseRenfix: TCMClientDataSet;
    CMSqlParams2: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
  private
    { Private declarations }
    CtrlInvestimento     : TCtrlInvestimento;
    CtrlRendaFixa        : TCtrlRendaFixa;
    procedure Seleciona;
  public
    { Public declarations }
  end;

var
  FrmCadTravaContabInvest: TFrmCadTravaContabInvest;
  iTipoInvest, iClassetit, iMercado : Integer;

implementation

uses UBibliotecaInvest;


{$R *.DFM}

procedure TFrmCadTravaContabInvest.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlRendaFixa := TCtrlRendaFixa.Create;
   CtrlRendaFixa.InitializeAs(Padroes);
   CtrlInvestimento := TCtrlInvestimento.Create;
   CtrlInvestimento.InitializeAs(Padroes);
   Seleciona;
end;

procedure TFrmCadTravaContabInvest.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(CtrlRendaFixa);
   FreeAndNil(CtrlInvestimento);
   CdsMercado.Close;
   CdsClasseRenfix.Close;
   CdsTipoInvest.Close;
end;

procedure TFrmCadTravaContabInvest.Seleciona;
begin
  cds.Data := CtrlInvContab.ListDataBloqueadaInvest;
  
end;

procedure TFrmCadTravaContabInvest.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
   if dbdDataBloq.CanFocus then
      dbdDataBloq.SetFocus;
end;

procedure TFrmCadTravaContabInvest.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := True;
  if CdsTipoInvest.FieldByName('IDTIPOINVEST').AsInteger = 1 then // Renda Fixa
  begin
     if dbdDataBloq.Date > pRPI.DATAULTFECHRF then
     begin
        Accept := False;
        MsgDlg('Data de Bloqueio : ' + dbdDataBloq.Text + #13 +
               'Maior que a de último Fechamento : ' + DateToStr(pRPI.DATAULTFECHRF),'Atenção' ,MtWarning,[mbok],0);
        if dbdDataBloq.CanFocus then
           dbdDataBloq.SetFocus;
        Cds.FieldByName('DTATRAVACTB').AsDateTime := pRPI.DATAULTFECHRF;
     end;
  end
  else if CdsTipoInvest.FieldByName('IDTIPOINVEST').AsInteger = 2 then // Renda Variavel
  begin
     if dbdDataBloq.Date > pRPI.DATAULTFECH then
     begin
        Accept := False;
        MsgDlg('Data de Bloqueio : ' + dbdDataBloq.Text + #13 +
               'Maior que a de último Fechamento : ' + DateToStr(pRPI.DATAULTFECH),'Atenção' ,MtWarning,[mbok],0);
        if dbdDataBloq.CanFocus then
           dbdDataBloq.SetFocus;
        Cds.FieldByName('DTATRAVACTB').AsDateTime := pRPI.DATAULTFECH;
     end;
  end
  else if CdsTipoInvest.FieldByName('IDTIPOINVEST').AsInteger = 8 then // BM&F
  begin
     if dbdDataBloq.Date > pRPI.DATAULTFECHBMF then
     begin
        Accept := False;
        MsgDlg('Data de Bloqueio : ' + dbdDataBloq.Text + #13 +
               'Maior que a de último Fechamento : ' + DateToStr(pRPI.DATAULTFECHBMF),'Atenção' ,MtWarning,[mbok],0);
        if dbdDataBloq.CanFocus then
           dbdDataBloq.SetFocus;
        Cds.FieldByName('DTATRAVACTB').AsDateTime := pRPI.DATAULTFECHBMF;
     end;
  end
  else if (CdsTipoInvest.FieldByName('IDTIPOINVEST').AsInteger = 5) or
          (CdsTipoInvest.FieldByName('IDTIPOINVEST').AsInteger = 6) or
          (CdsTipoInvest.FieldByName('IDTIPOINVEST').AsInteger = 7) or
          (CdsTipoInvest.FieldByName('IDTIPOINVEST').AsInteger = 9) then // Fundos
  begin
     if dbdDataBloq.Date > pRPI.DATAULTFECHFDO then
     begin
        Accept := False;
        MsgDlg('Data de Bloqueio : ' + dbdDataBloq.Text + #13 +
               'Maior que a de último Fechamento : ' + DateToStr(pRPI.DATAULTFECHFDO),'Atenção' ,MtWarning,[mbok],0);
        if dbdDataBloq.CanFocus then
           dbdDataBloq.SetFocus;
        Cds.FieldByName('DTATRAVACTB').AsDateTime := pRPI.DATAULTFECHFDO;
     end;
  end;
end;

procedure TFrmCadTravaContabInvest.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   CmeCadastro.RepetirInsert := False;
end;

procedure TFrmCadTravaContabInvest.FormShow(Sender: TObject);
begin
  inherited;
   CdsMercado.Data      := CtrlInvestimento.ListMercado;
   CdsClasseRenfix.Data := CtrlRendaFixa.ListClasseRenFix;
   CdsTipoInvest.Data   := CtrlInvestimento.ListTipoInvest;
end;

procedure TFrmCadTravaContabInvest.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
   iTipoInvest := 0;
   iClassetit  := -1;
   iMercado    := -1;

   if Trim(dblkClasseTit.Text) <> '' then
      iClassetit := CdsClasseRenfix.FieldByName('IDCLASSETIT').AsInteger
   else if Trim(dblkMercado.Text) <> '' then
      iMercado   := CdsMercado.FieldByName('IDMERCADO').AsInteger
   else if (Trim(dblkClasseTit.Text) = '') and (Trim(dblkMercado.Text) = '') then
      iTipoInvest := CdsTipoInvest.FieldByName('IDTIPOINVEST').AsInteger;

   Accept := CtrlInvContab.AplicaAtualDataBloqInvest(dbdDataBloq.Date, iTipoInvest, iClassetit, iMercado);

   if not Accept then
      MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
             'Motivo: ' + CtrlInvContab.MessageInfo,'Erro',mtError,[mbOk],0);
  inherited;
   Seleciona;
end;

end.
