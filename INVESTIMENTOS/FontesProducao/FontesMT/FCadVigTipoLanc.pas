unit FCadVigTipoLanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInv, Menus, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  fcLabel, faMensagem, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls,
  TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, wwdbedit, Wwdotdot,
  Wwdbcomb, wwdbdatetimepicker, CMDateTimePicker, DBCtrls, uCmSqlParams,
  uCtrlEmpAcoes, uCtrlPadroes, uMensErro;

type
  TfrmCadVigTipoLanc = class(TFrmCadastroGridMTInv)
    lblDtOperacao: TLabel;
    dbDtaVigencia: TCMDateTimePicker;
    dbrTipoLanc: TDBRadioGroup;
    CMSql: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure dbGrdDblClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
     CtrlEmpAcoes : TCtrlEmpAcoes;
  public
    { Public declarations }
  end;

var
  frmCadVigTipoLanc: TfrmCadVigTipoLanc;

implementation

{$R *.DFM}

procedure TfrmCadVigTipoLanc.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlEmpAcoes := TCtrlEmpAcoes.Create;
   CtrlEmpAcoes.InitializeAs(Padroes);
   CtrlEmpAcoes.CdsLancVigEmp := Cds;

   cds.data := CtrlEmpAcoes.ListLancVigEmp;
end;

procedure TfrmCadVigTipoLanc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(CtrlEmpAcoes);
end;

procedure TfrmCadVigTipoLanc.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
   Accept := CtrlEmpAcoes.AplicaAtualLancVigEmp;

   if not Accept then
      MsgDlg('Ocorreu um erro na exclusão do Registro.' + #13 +
             'Motivo: ' + CtrlEmpAcoes.MessageInfo,'Atenção',mtWarning,[mbOk],0)
   else
     cds.data := CtrlEmpAcoes.ListLancVigEmp;

  inherited;

end;

procedure TfrmCadVigTipoLanc.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin

   Accept := CtrlEmpAcoes.AplicaAtualLancVigEmp;

   if not Accept then
      MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
             'Motivo: ' + CtrlEmpAcoes.MessageInfo,'Atenção',mtWarning,[mbOk],0)
   else
      cds.data := CtrlEmpAcoes.ListLancVigEmp;

  inherited;

end;

procedure TfrmCadVigTipoLanc.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := False;
  if Trim(dbDtaVigencia.Text) = '' then
  begin
     MsgDlg('Data de vigência não informada.','Atenção' ,MtWarning,[mbok],0);
     if dbDtaVigencia.CanFocus then
        dbDtaVigencia.SetFocus;
  end
  else if Trim(dbrTipoLanc.Value) = '' then
  begin
     MsgDlg('Selecionar o Tipo de Lançamento.','Atenção',mtWarning,[mbOK],0);
     if dbrTipoLanc.CanFocus then
        dbrTipoLanc.SetFocus;
  end
  else
     Accept := True;
end;

procedure TfrmCadVigTipoLanc.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
    cds.data := CtrlEmpAcoes.ListLancVigEmp;
end;

procedure TfrmCadVigTipoLanc.dbGrdDblClick(Sender: TObject);
begin
   if cds.RecordCount > 0  then
      inherited;
end;

procedure TfrmCadVigTipoLanc.sbtnApagarClick(Sender: TObject);
begin
   if cds.RecordCount > 0  then
      inherited;
end;

procedure TfrmCadVigTipoLanc.bbtnConfirmarClick(Sender: TObject);
begin
   CmeCadastro.RepetirInsert := False;
   
  inherited;

end;

procedure TfrmCadVigTipoLanc.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
      Cds.Locate('IDLANCVIGEMP',MontaSelect.ValoresChave[0],[]);
end;

end.
