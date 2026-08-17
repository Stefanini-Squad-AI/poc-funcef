// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Douglas.Siqueira
// Data        : 30/04/2012
// Pendência   : SOL 178186 KTN 1635216
// Descricao   : Solicitamos que na tela de Retenção e Encerramento quando o motivo da retenção/encerramento estiver com a opção FALECIMENTO marcada a opção "Não efetuar acerto financeiro" deva vir marcada como default e sem opção de alteração.
//------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Data        : 26/08/2011
// Pendência   : SOL 149847 KTN 1107845
// Descricao   : Criação
//------------------------------------------------------------------------------

unit FCadMotivoRE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, StdCtrls, Mask, DBCtrls, Db, DBTables, Wwquery,
  CmEventosCadastro, ImgList, MontaSelect, Wwdatsrc, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls;

type
  TFrmCadMotivoRE = class(TfrmCadastroCS)
    dbedMotivo: TDBEdit;
    lblNome: TLabel;
    DBRdTipo: TDBRadioGroup;
    GbSituacaxo: TGroupBox;
    DBChcAtivo: TDBCheckBox;
    DBChkSaidaConvenio: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    DBChkAcertoFinan: TDBCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure HabilitaBotoes(Controle : boolean);
  public
    { Public declarations }
  end;

var
  FrmCadMotivoRE: TFrmCadMotivoRE;

implementation

{$R *.DFM}
 uses UDataBase, UMensErro, usistema;

procedure TFrmCadMotivoRE.FormActivate(Sender: TObject);
begin
   inherited;
 //  if not qry.Active
 //  then begin
  //    qry.Close;
  //    qry.Open;
  // end;
end;

procedure TFrmCadMotivoRE.HabilitaBotoes(Controle : boolean);
begin
   sbtnAlterar.Enabled   := Controle;
   sbtnApagar.Enabled    := Controle;
   sbtnProcurar.Enabled  := not(Controle);
   bbtnConfirmar.Enabled := Controle;
   bbtnCancelar.Enabled  := Controle;

end;

procedure TFrmCadMotivoRE.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;
   Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
   Except
   End;
end;

procedure TFrmCadMotivoRE.qryBeforePost(DataSet: TDataSet);
VAR iIdMotivo : extended;
begin
   inherited;
   if Trim(dbedMotivo.Text) = ''
   then begin
      MsgDlg('Preencha a Descrição do Motivo.','Erro',mtError,[mbOK],0);
      Abort;
   end;
   iIdMotivo := LeUltRegistro(nil,'MOTIVORE');
   if qry.State = dsInsert
   then begin

      qry.FieldByName('ID_MOTIVO').Asfloat := iIdMotivo;

   end;
end;

procedure TFrmCadMotivoRE.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if not MontaSelect.RetornouValor then Exit;
   if not qry.Active
   then begin
      qry.Close;
      qry.Open;
   end;
   qry.Locate('ID_MOTIVO',StrToInt(MontaSelect.ValoresChave[0]),[loCaseInsensitive]);
end;

procedure TFrmCadMotivoRE.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   dbedMotivo.SetFocus;
end;

procedure TFrmCadMotivoRE.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   dbedMotivo.SetFocus;
end;

procedure TFrmCadMotivoRE.sbtnInserirClick(Sender: TObject);
begin
   if not qry.Active
   then begin
      qry.Close;
      qry.Open;
   end;
   inherited;

end;

procedure TFrmCadMotivoRE.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if qry.Active
   then begin
      qry.Close;
   end;
   sbtnInserir.Down := false;
   HabilitaBotoes(False);
end;

procedure TFrmCadMotivoRE.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   if qry.Active
   then begin
      qry.Close;
   end;
   sbtnInserir.Down := false;
   HabilitaBotoes(False);
end;

procedure TFrmCadMotivoRE.sbtnApagarClick(Sender: TObject);
begin
   inherited;
   if qry.Active
   then begin
      qry.Close;
   end;
   HabilitaBotoes(False);
end;

end.
