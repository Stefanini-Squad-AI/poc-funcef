unit FCadEveCxCota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, StdCtrls, Mask, wwdbedit, wwdblook, CmEventosCadastro,
  ImgList, Db, Wwdatsrc, MontaSelect, DBTables, IvDictio, IvMulti,
  IvEMulti, Wwquery, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  DBCtrls;

type
  TfrmCadEveCxCota = class(TfrmCadastroCS)
    pnlDados: TPanel;
    dbeDescricao: TwwDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dblTipoOperacao: TwwDBLookupCombo;
    Label4: TLabel;
    dblRegra: TwwDBLookupCombo;
    qryTipoOperacao: TwwQuery;
    qryRegra: TwwQuery;
    qryRegraIDREGRA: TFloatField;
    qryRegraNOMEREGRA: TStringField;
    Panel2: TPanel;
    dbchkCotiza: TDBCheckBox;
    Panel3: TPanel;
    dbchkCota: TDBCheckBox;
    dbchkCaixa: TDBCheckBox;
    dbrAtivoPassivo: TDBRadioGroup;
    dbrSomaDiminui: TDBRadioGroup;
    DBCheckBox1: TDBCheckBox;
    qryIDEVENTOCAIXACOTA: TFloatField;
    qryDESCCAIXACOTA: TStringField;
    qryIDTIPOINVEST: TFloatField;
    qryIDTIPOOPERACAO: TFloatField;
    qryIDTIPODESPINVEST: TFloatField;
    qrySTACAIXA: TStringField;
    qrySTACOTA: TStringField;
    qrySTAATIVOPASSIVO: TStringField;
    qrySTACOTIZA: TStringField;
    qrySTASOMADIMINUI: TStringField;
    qryIDREGRA: TFloatField;
    qrySTACPMF: TStringField;
    qryTipoOperacaoDESCTIPOOPERACAO: TStringField;
    qryTipoOperacaoIDOPERACAO: TStringField;
    qryTipoOperacaoIDTIPOOPERACAO: TFloatField;
    qryTipoOperacaoIDTIPODESPINVEST: TFloatField;
    qryTipoOperacaoIDTIPOINVEST: TFloatField;
    qryIDOPERACAO: TStringField;
    procedure dbchkCotaClick(Sender: TObject);
    procedure dbchkCaixaClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(S : LongInt);
  public
    { Public declarations }
  end;

var
  frmCadEveCxCota: TfrmCadEveCxCota;

implementation
Uses UDataBase, uMensErro, UBibliotecaInvest;

{$R *.DFM}

procedure TfrmCadEveCxCota.dbchkCotaClick(Sender: TObject);
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

procedure TfrmCadEveCxCota.dbchkCaixaClick(Sender: TObject);
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

procedure TfrmCadEveCxCota.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  if dbeDescricao.CanFocus then
     dbeDescricao.SetFocus;

  Qry.FieldByName('IDEVENTOCAIXACOTA').AsInteger := LeUltRegistro(Nil,'EVENTOCAIXACOTA');     
end;

procedure TfrmCadEveCxCota.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  if dbeDescricao.CanFocus then
     dbeDescricao.SetFocus;

end;

procedure TfrmCadEveCxCota.Sel(S: Integer);
begin
  qry.Close;
  qry.ParamByName('IDEVENTOCAIXACOTA').AsInteger := S;
  qry.Open;

end;

procedure TfrmCadEveCxCota.FormCreate(Sender: TObject);
begin
  inherited;
  Sel(0);
end;

procedure TfrmCadEveCxCota.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  begin
     Sel(StrToInt(MontaSelect.ValoresChave[0]));
     if qryIDTIPOOPERACAO.AsInteger = 0 then begin
        dblTipoOperacao.LookupValue := qryIDTIPODESPINVEST.AsString;
        dblTipoOperacao.Text := MontaSelect.ValoresChave[2];
     end else if qryIDTIPODESPINVEST.AsInteger = 0 then begin
        dblTipoOperacao.LookupValue := qryIDTIPOOPERACAO.AsString;
        dblTipoOperacao.Text := MontaSelect.ValoresChave[1];
     end;
  end;
end;

procedure TfrmCadEveCxCota.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  Accept := True;
  if Trim(dbeDescricao.Text) = '' then
  begin
     MsgDlg('Descrição do Evento não preenchida','Erro',mtError,[mbOK],0);
     dbeDescricao.SetFocus;
     Accept := False;
  end;
  
{  if dblTipoOperacao.LookupValue = '' then
  begin
     MsgDlg('Tipo de Operação não selecionada','Erro',mtError,[mbOK],0);
     dblTipoOperacao.SetFocus;
     Accept := False;
  end;
  if dblRegra.LookupValue = '' then
  begin
     MsgDlg('Regra não selecionada','Erro',mtError,[mbOK],0);
     dblRegra.SetFocus;
     Accept := False;
  end;  }

  if (not dbchkCaixa.Checked) and (not dbchkCota.Checked) then
  begin
     MsgDlg('O Evento deve ser do tipo Caixa, Cota ou ambos','Erro',mtError,[mbOK],0);
     dbchkCaixa.SetFocus;
     Accept := False;
  end;

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

  inherited;

end;

procedure TfrmCadEveCxCota.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
//  if MontaSelect.RetornouValor then
//  begin
//     Sel(StrToInt(MontaSelect.ValoresChave[0]));
//     CmeCadastro.AtualizaBotoes(Self);
//  end;
  if dbeDescricao.CanFocus then
     dbeDescricao.SetFocus;

end;


procedure TfrmCadEveCxCota.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qrySTACAIXA.AsString := 'N';
  qrySTACOTA.AsString := 'N';
  qrySTACOTIZA.AsString := 'N';
end;

procedure TfrmCadEveCxCota.bbtnConfirmarClick(Sender: TObject);
begin

  inherited;
//  dblTipoOperacao.Clear;
end;

end.
