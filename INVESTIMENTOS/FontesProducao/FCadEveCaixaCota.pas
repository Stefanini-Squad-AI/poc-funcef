//******************************************************************************
// Data      : 07/06/2006
// Código    : AL_2
// Pendencia :
// SOL       :
// Motivo    : Ajuste na consulta "Qry" e na combo do tipo de operação, para mostrar
//             o tipo de investimento
//******************************************************************************
// Data      : 10/02/2006          
// Código    : AL_1
// Pendencia :
// SOL       :
// Motivo    : Ajuste no layout da tela
//******************************************************************************

unit FCadEveCaixaCota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCsInv, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, faMensagem, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, fcLabel, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, DBCtrls, wwdblook, Mask, wwdbedit;

type
  TfrmCadEveCaixaCota = class(TFrmCadastroGridCSInv)
    qryTipoOperacao: TwwQuery;
    qryTipoOperacaoDESCTIPOOPERACAO: TStringField;
    qryTipoOperacaoIDOPERACAO: TStringField;
    qryTipoOperacaoIDTIPOOPERACAO: TFloatField;
    qryTipoOperacaoIDTIPODESPINVEST: TFloatField;
    qryTipoOperacaoIDTIPOINVEST: TFloatField;
    qryRegra: TwwQuery;
    qryRegraNOMEREGRA: TStringField;
    qryRegraIDREGRA: TFloatField;
    Label2: TLabel;
    dbeDescricao: TwwDBEdit;
    Label3: TLabel;
    dblTipoOperacao: TwwDBLookupCombo;
    Label4: TLabel;
    dblRegra: TwwDBLookupCombo;
    Panel2: TPanel;
    dbchkCotiza: TDBCheckBox;
    dbchkCota: TDBCheckBox;
    dbrAtivoPassivo: TDBRadioGroup;
    Panel3: TPanel;
    dbchkCaixa: TDBCheckBox;
    dbrSomaDiminui: TDBRadioGroup;
    DBCheckBox1: TDBCheckBox;
    qryIDEVENTOCAIXACOTA: TFloatField;
    qryDESCCAIXACOTA: TStringField;
    qryIDTIPOINVEST: TFloatField;
    qryDESCTIPOINVEST: TStringField;
    qryIDTIPOOPERACAO: TFloatField;
    qryDESCTIPOOPERACAO: TStringField;
    qryIDTIPODESPINVEST: TFloatField;
    qryDESCTIPODESPINV: TStringField;
    qryIDOPERACAO: TStringField;
    qrySTACAIXA: TStringField;
    qrySTACOTA: TStringField;
    qrySTAATIVOPASSIVO: TStringField;
    qrySTACOTIZA: TStringField;
    qrySTASOMADIMINUI: TStringField;
    qryIDREGRA: TFloatField;
    qryNOMEREGRA: TStringField;
    qrySTACPMF: TStringField;
    Label1: TLabel;
    dbeTipoInvest: TwwDBEdit;
    qryTipoOperacaoDESCTIPOINVEST: TStringField;
    procedure dbchkCotaClick(Sender: TObject);
    procedure dbchkCaixaClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure dblTipoOperacaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblTipoOperacaoExit(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(iTpInv : Integer = -1;
                  iTpOper: Integer = -1;
                  iTpDesp: Integer = -1;
                  sCxCt: String = '');

  public
    { Public declarations }
  end;

var
  frmCadEveCaixaCota: TfrmCadEveCaixaCota;

implementation

uses UDataBase, uMensErro, UBibliotecaInvest, UOperComum;

{$R *.DFM}

{ TfrmCadEveCaixaCota }

procedure TfrmCadEveCaixaCota.Sel(iTpInv, iTpOper, iTpDesp: Integer; sCxCt: String);
begin
   try
      OperComum.LimpaParametros(qry);
      if iTpInv > 0 then
         qry.ParamByName('IDTIPOINVEST').AsInteger := iTpInv;
      if iTpOper > 0 then
         qry.ParamByName('IDTIPOOPERACAO').AsInteger := iTpOper;
      if iTpDesp > 0 then
         qry.ParamByName('IDTIPODESPINVEST').AsInteger := iTpDesp;
      if sCxCt <> '' then
         qry.ParamByName('STACAIXACOTA').AsString := sCxCt;
      qry.Open;
   except
      OperComum.LimpaParametros(qry);
      qry.Open;
   end;
end;

procedure TfrmCadEveCaixaCota.dbchkCotaClick(Sender: TObject);
begin
  inherited;
  if dbchkCota.Checked then
  begin
     dbrAtivoPassivo.Visible := True;
     dbchkCotiza.Visible := True;
  end else begin
     dbrAtivoPassivo.Visible := False;
     dbchkCotiza.Visible := False;
     if ds.State in [dsInsert, dsEdit] then
     begin
        qrySTAATIVOPASSIVO.Clear;
        qrySTACOTIZA.Clear;
     end;
  end

end;

procedure TfrmCadEveCaixaCota.dbchkCaixaClick(Sender: TObject);
begin
  inherited;
  if dbchkCaixa.Checked then
     dbrSomaDiminui.Visible := True
  else begin
     dbrSomaDiminui.Visible := False;
     if ds.State in [dsInsert, dsEdit] then
        qrySTASOMADIMINUI.Clear;
  end;
end;

procedure TfrmCadEveCaixaCota.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  if dbeDescricao.CanFocus then
     dbeDescricao.SetFocus;
end;

procedure TfrmCadEveCaixaCota.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  if dbeDescricao.CanFocus then
     dbeDescricao.SetFocus;
end;

procedure TfrmCadEveCaixaCota.FormShow(Sender: TObject);
begin
  inherited;
  Sel;
end;

procedure TfrmCadEveCaixaCota.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
  Accept := False;
  if Trim(dbeDescricao.Text) = '' then
  begin
     MsgDlg('Descrição do Evento não preenchida','Mensagem do Sistema',mtWarning,[mbOK],0);
     dbeDescricao.SetFocus;
     Exit;
  end;

  if (not dbchkCaixa.Checked) and (not dbchkCota.Checked) then
  begin
     MsgDlg('O Evento deve ser do tipo Caixa, Cota ou ambos','Mensagem do Sitema',mtWarning,[mbOK],0);
     dbchkCaixa.SetFocus;
     Exit;
  end;

  try
     if qry.State = dsInsert then
        qryIDEVENTOCAIXACOTA.AsInteger := LeUltRegistro(nil, 'EVENTOCAIXACOTA');

     if Trim(dblTipoOperacao.Text) = '' then
     begin
        qryIDTIPOOPERACAO.Clear;
        qryIDTIPODESPINVEST.Clear;
        qryIDTIPOINVEST.Clear;
     end else begin

        qryIDTIPOINVEST.AsInteger := qryTipoOperacaoIDTIPOINVEST.AsInteger;

        if (qryTipoOperacaoIDTIPOOPERACAO.AsInteger <> 0) then
            qryIDTIPOOPERACAO.AsInteger := qryTipoOperacaoIDTIPOOPERACAO.AsInteger
        else qryIDTIPOOPERACAO.Clear;

        if (qryTipoOperacaoIDTIPODESPINVEST.AsInteger <> 0) then
            qryIDTIPODESPINVEST.AsInteger :=
                qryTipoOperacaoIDTIPODESPINVEST.AsInteger
        else qryIDTIPODESPINVEST.Clear;
     end;

     if Trim(dblRegra.Text) = '' then
        qryIDREGRA.Clear;

     if dbchkCota.Checked = False then
     begin
        qrySTAATIVOPASSIVO.Clear;
        qrySTACOTIZA.Clear;
     end;

     if dbchkCaixa.Checked = False then
        qrySTASOMADIMINUI.Clear;

     Accept := True;
  except
     Accept := False;
     Exit;
  end;

  inherited;

end;

procedure TfrmCadEveCaixaCota.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qrySTACAIXA.AsString := 'N';
  qrySTACOTA.AsString := 'N';
  qrySTACOTIZA.AsString := 'N';
end;

procedure TfrmCadEveCaixaCota.bbtnConfirmarClick(Sender: TObject);
var iTpInv, iTpOper, iTpDesp, iPos: Integer;
    sCxCt, sDesc: String;
begin
   iTpInv := qry.ParamByName('IDTIPOINVEST').AsInteger;
   iTpOper := qry.ParamByName('IDTIPOOPERACAO').AsInteger;
   iTpDesp := qry.ParamByName('IDTIPODESPINVEST').AsInteger;
   sCxCt := qry.ParamByName('STACAIXACOTA').AsString;
   CmeCadastro.RepetirInsert := False;
   inherited;
   iPos := qryIDEVENTOCAIXACOTA.AsInteger;
   sDesc := qryDESCCAIXACOTA.AsString;
   Sel(iTpInv, iTpOper, iTpDesp, sCxCt);
   if not qry.Locate('IDEVENTOCAIXACOTA', iPos, []) then
      if not qry.Locate('DESCCAIXACOTA', sDesc, [loPartialKey]) then
         qry.First;
end;

procedure TfrmCadEveCaixaCota.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      qry.Locate('IDEVENTOCAIXACOTA', StrToInt(MontaSelect.ValoresChave[0]), []);
end;

procedure TfrmCadEveCaixaCota.dblTipoOperacaoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if Trim(dblTipoOperacao.Text) <> '' then
      dbeTipoInvest.Text := qryTipoOperacaoDESCTIPOINVEST.AsString
   else
      dbeTipoInvest.Clear;
end;

procedure TfrmCadEveCaixaCota.dblTipoOperacaoExit(Sender: TObject);
begin
   inherited;
   if Trim(dblTipoOperacao.Text) <> '' then
      dbeTipoInvest.Text := qryTipoOperacaoDESCTIPOINVEST.AsString
   else
      dbeTipoInvest.Clear;
end;

end.

