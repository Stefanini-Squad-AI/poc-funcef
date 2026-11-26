{
--------------------------------------------------------------------------------
Pendência   : SIG 22246
Responsável : Darivaldo Alencar
Data        : 04/08/2016
Descrição   : Criação deste fonte: funcionalidade Coluna do Mapa de Folha
Rotina      :
--------------------------------------------------------------------------------
}
unit fColMapaFolha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, StdCtrls, Mask, wwdbedit, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,dBaseDados,uSistema,
  DBTables, Wwquery,UMensErro, Provider,uCmDbObject,uCtrlColMapaFolha,uCMTypes,UFuncoesPrevMT50;

type
  TFrmColMapaFolha = class(TFrmCadastroMT)
    lblCodInterno: TLabel;
    dbedtCodInterno: TwwDBEdit;
    lblDescricao: TLabel;
    dbedtDescricao: TwwDBEdit;
    CdsIDCOLUNAMAPA: TFloatField;
    CdsDESCRICAO: TStringField;
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure dbedtDescricaoExit(Sender: TObject);
  private
    iCodInterno: Integer;
     sDescricaoColMapaFolha : String;
    CtrlColMapaFolha : TCtrlColMapaFolha;
    procedure MessageCtrlColMapaFolha(sMessageInfo: String);
  public
    { Public declarations }
  end;

var
  FrmColMapaFolha: TFrmColMapaFolha;

implementation

{$R *.DFM}

procedure TFrmColMapaFolha.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if (dbedtDescricao.text = EmptyStr) then
     begin
        CtrlColMapaFolha.getMsg(MSG1);
        Accept := False;
     end;

  If (CtrlColMapaFolha.ExisteDescricao(Cds.FieldByName('DESCRICAO').AsString)) Then
  Begin
    CtrlColMapaFolha.getMsg(MSG3);
    dbedtDescricao.SetFocus;
    Accept := False;
  End;
end;

procedure TFrmColMapaFolha.sbtnApagarClick(Sender: TObject);
begin
  sDescricaoColMapaFolha := dbedtDescricao.text;

  if CtrlColMapaFolha.getMsg(MSG4) then
    begin
        if (CtrlColMapaFolha.ExisteIDPROVDESC(dbedtCodInterno.Text)) then
           begin
             CtrlColMapaFolha.getMsg(MSG2);
             CmeCadastro.Operacao := opIdle;
             sbtnApagar.Down := False;
             exit;
            end;

        //inherited; A Mensagem de excluir da especificação é diferente da msg da herança

         if CmeCadastro.Operacao = opIdle then
         begin
              Try
                CmeCadastro.Operacao := opApagar;
                CmeCadastro.Delete(Self);
                if cds.IsEmpty then
                   CmeCadastro.Operacao := opVazio
                else
                    CmeCadastro.Operacao := opIdle;
                CmeCadastro.AtualizaBotoes(Self);
              Except
                CmeCadastro.Operacao := opIdle;
                sbtnApagar.Down := False;
                Raise;
              End;
         end;

   end
   else
    begin
     CmeCadastro.Operacao := opIdle;
     sbtnApagar.Down := False;
    end;
end;

procedure TFrmColMapaFolha.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlColMapaFolha := TCtrlColMapaFolha.Create;

  CtrlColMapaFolha.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                              Sistema.ConnectionSide, Sistema.AppRemoteServer,
                              True, MessageCtrlColMapaFolha );
  Cds.CreateDataSet;
end;

procedure TFrmColMapaFolha.MessageCtrlColMapaFolha(sMessageInfo: String);
begin
  MsgDlg(sMessageInfo, 'Erro', mtError, [mbOk],0)
end;

procedure TFrmColMapaFolha.CmeCadastroConfirma(Sender: TObject);
Var
  sTextoLog : String;
begin
  inherited;
  If CmeCadastro.Operacao = opInserir then
    sTextoLog := 'Inclusão da Coluna do Mapa de Folha '+dbedtCodInterno.Text
  Else If CmeCadastro.Operacao = OpAlterar then
    sTextoLog := 'Manutenção da Coluna do Mapa de Folha '+dbedtCodInterno.Text
  Else If CmeCadastro.Operacao = OpApagar then
    sTextoLog := 'Exclusão da Coluna do Mapa de Folha '+sDescricaoColMapaFolha;

  If Not GravaLogOperacao(sTextoLog) Then Begin { Função está em UFuncoesPrevMT50 }
    Raise Exception.Create( 'Erro ao gravar o log da Operação ' );
    Exit;
  End;

  CtrlColMapaFolha.CdsColMapaFolha.Data := Cds.Data;
  CtrlColMapaFolha.GravaColMapaFolha;

  if (MontaSelect.RetornouValor) then
    Cds.Data := CtrlColMapaFolha.SelecionaColMapaFolha(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TFrmColMapaFolha.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedtDescricao.SetFocus;
end;

procedure TFrmColMapaFolha.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if (MontaSelect.RetornouValor) then
    Cds.Data := CtrlColMapaFolha.SelecionaColMapaFolha(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TFrmColMapaFolha.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbedtDescricao.SetFocus;
end;

procedure TFrmColMapaFolha.dbedtDescricaoExit(Sender: TObject);
var m:integer;
begin
  inherited;
end;

end.
