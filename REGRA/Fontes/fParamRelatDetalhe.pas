unit fParamRelatDetalhe;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Buttons, StdCtrls, Machklb, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, TB97, ExtCtrls, MontaSelect;

type
  TfrmParamRelatDetalhe = class(TfrmOkCancelar)
    chkTipos: TCMchklistbox;
    GroupBox4: TGroupBox;
    ms1: TMontaSelect;
    Label1: TLabel;
    edtId: TEdit;
    edtDesc: TEdit;
    Label2: TLabel;
    sbtnSelecionar: TSpeedButton;
    procedure sbtnSelecionarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRelatDetalhe: TfrmParamRelatDetalhe;

implementation

uses dRelDetalhes, fAguarde, uSistema, uMensErro;

{$R *.DFM}

procedure TfrmParamRelatDetalhe.sbtnSelecionarClick(Sender: TObject);
var
   vId : LongInt;
begin
  inherited;
  ms1.Executar;
  if ms1.RetornouValor then begin
     try
        vId := StrtoInt(Ms1.ValoresChave[2]);
     except
           vId := 0;
     end;

     with dtmRelDetalhes.QryPermissao do begin
          Close;
          ParambyName('GRUPO').AsInteger := vId;
          ParambyName('USUARIO').AsInteger := Sistema.IdUsuario;
          Open;
     end;

     if dtmRelDetalhes.QryPermissao.IsEmpty then begin
        MsgDlg('Usuário ('+Sistema.NomeUsuario+') sem permissão de consulta a este tipo de regra.','Erro',mtError,[mbOK],0);
        frmAguarde.Apaga;
        Exit;
     end else begin
         if dtmRelDetalhes.QryPermissao.FieldbyName('FLGPROCURAR').AsInteger = 0 then begin
            MsgDlg('Usuário ('+Sistema.NomeUsuario+') sem permissão de consulta a este tipo de regra.','Erro',mtError,[mbOK],0);
            frmAguarde.Apaga;
            Exit;
         end;
     end;

     edtId.Text := ms1.ValoresChave[0];
     edtDesc.Text := ms1.ValoresChave[1];
     frmAguarde.Mostra('Selecionando Dados ...');
     frmAguarde.Refresh;
     frmAguarde.Max := 7;
     frmAguarde.Min := 0;
     frmAguarde.Pos := 0;
     frmAguarde.Pos := frmAguarde.Pos + 1;
     with dtmRelDetalhes.Qry do begin
          Close;
          ParambyName('ID').AsInteger := StrtoInt(ms1.ValoresChave[0]);
          Open;
     end;
     frmAguarde.Pos := frmAguarde.Pos + 1;
     with dtmRelDetalhes.QryCampo do begin
          Close;
          ParambyName('ID').AsInteger := StrtoInt(ms1.ValoresChave[0]);
          Open;
     end;
     frmAguarde.Pos := frmAguarde.Pos + 1;
     with dtmRelDetalhes.QryFormula do begin
          Close;
          ParambyName('ID').AsInteger := StrtoInt(ms1.ValoresChave[0]);
          Open;
     end;
     frmAguarde.Pos := frmAguarde.Pos + 1;
     with dtmRelDetalhes.QryRegra do begin
          Close;
          ParambyName('ID').AsInteger := StrtoInt(ms1.ValoresChave[0]);
          Open;
     end;
     frmAguarde.Pos := frmAguarde.Pos + 1;
     with dtmRelDetalhes.QryVariavel do begin
          Close;
          ParambyName('ID').AsInteger := StrtoInt(ms1.ValoresChave[0]);
          Open;
     end;
     frmAguarde.Pos := frmAguarde.Pos + 1;
     with dtmRelDetalhes.QryPai do begin
          Close;
          ParambyName('ID').AsString := ms1.ValoresChave[0];
          Open;
     end;
     frmAguarde.Pos := frmAguarde.Pos + 1;
     with dtmRelDetalhes.QryCamposChave do begin
          Close;
          ParambyName('ID').AsInteger := StrtoInt(ms1.ValoresChave[0]);
          Open;
     end;
     frmAguarde.Apaga;
  end;
end;

procedure TfrmParamRelatDetalhe.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if chkTipos.Selected[0] then begin
     dtmRelDetalhes.ppSubCampo.Visible := True;
     if dtmRelDetalhes.QryCampo.IsEmpty then
        dtmRelDetalhes.ppSubCampo.Visible := False;
  end else
      dtmRelDetalhes.ppSubCampo.Visible := False;

  if chkTipos.Selected[1] then begin
     dtmRelDetalhes.ppSubFormula.Visible := True;
     if dtmRelDetalhes.QryFormula.IsEmpty then
        dtmRelDetalhes.ppSubFormula.Visible := False;
  end else
      dtmRelDetalhes.ppSubFormula.Visible := False;

  if chkTipos.Selected[2] then begin
     dtmRelDetalhes.ppSubRegra.Visible := True;
     if dtmRelDetalhes.QryRegra.IsEmpty then
        dtmRelDetalhes.ppSubRegra.Visible := False;
  end else
      dtmRelDetalhes.ppSubRegra.Visible := False;

  if chkTipos.Selected[3] then begin
     dtmRelDetalhes.ppSubVariavel.Visible := True;
     if dtmRelDetalhes.QryVariavel.IsEmpty then
        dtmRelDetalhes.ppSubVariavel.Visible := False;
  end else
      dtmRelDetalhes.ppSubVariavel.Visible := False;

  if chkTipos.Selected[4] then begin
     dtmRelDetalhes.ppSubRegrasPai.Visible := True;
     if dtmRelDetalhes.QryPai.IsEmpty then
        dtmRelDetalhes.ppSubRegrasPai.Visible := False;
  end else
      dtmRelDetalhes.ppSubRegrasPai.Visible := False;

  if chkTipos.Selected[5] then begin
     dtmRelDetalhes.ppSubCampoChave.Visible := True;
     if dtmRelDetalhes.QryCamposChave.IsEmpty then
        dtmRelDetalhes.ppSubCampoChave.Visible := False;
  end else
      dtmRelDetalhes.ppSubCampoChave.Visible := False;
end;

procedure TfrmParamRelatDetalhe.FormCreate(Sender: TObject);
var
   i : LongInt;
begin
  inherited;
  for i := 0 to chkTipos.Items.Count - 1 do
      chkTipos.Selected[i] := True;
  { Preenche o ususario do MontaSelect de pesquisa de Regras }
  MS1.Filtro.Add ('( GRUPOREGRAUSUARIO.IDUSUARIO = '+
                           IntToStr(Sistema.IdUsuario)+')');
end;

end.
