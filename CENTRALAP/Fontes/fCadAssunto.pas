(*******************************************************************************
 Analista Responsável: Gustavo Viegas
 - Atualizado em 14/09/2000
   Novo Modelo do Central AP: Alterações para o controle de RUBS;
 - 04/10/2000
   Inclusão do Filtro dos Modelo de RUBS pela coluna FLGTIPOARQUIVO = 'R' que
   caracteriza um arquivo de RUBS.
- David Ayrolla - 03/05/2005 - Pendência 18425
  Incluído campo "Página do Auto-Atendimento".      
*******************************************************************************)

unit fCadAssunto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  DBCtrls, Mask, wwdbedit, wwdblook, FCadastroCS, wwriched,
  CmEventosCadastro, ImgList, {$IFNDEF Versao05} UcmTypes, Wwdotdot,
  Wwdbcomb {$ELSE} uComum {$ENDIF}, usistema;

type
  TfrmCadAssunto = class(TfrmCadMestreDetalheCS)
    qryprocesso: TwwQuery;
    tpprocess: TLabel;
    Label1: TLabel;
    CmbGrupoAssunto: TwwDBLookupCombo;
    ednome: TwwDBEdit;
    QryDet: TwwQuery;
    updDet: TUpdateSQL;
    QryDetIDASSUNTOXRESP: TFloatField;
    QryDetIDRESPATEND: TFloatField;
    QryDetIDASSUNTO: TFloatField;
    Label2: TLabel;
    MsResposta: TMontaSelect;
    BtnSelResposta: TBitBtn;
    qryprocessoIDTIPOPROCESSO: TFloatField;
    qryprocessoNOME: TStringField;
    QryRubs: TwwQuery;
    Label3: TLabel;
    CmbRub: TwwDBLookupCombo;
    Label4: TLabel;
    cmbprocesso: TwwDBLookupCombo;
    QryGrupoAssunto: TwwQuery;
    QryGrupoAssuntoIDGRUPOASSUNTO: TFloatField;
    QryGrupoAssuntoDESCGRUPOASSUNTO: TStringField;
    QryDetDESCRESPATEN: TMemoField;
    ReResposta: TwwDBRichEdit;
    ReRespostaGrid: TwwDBRichEdit;
    QryRubsIDCONFIGRUBS: TFloatField;
    QryRubsDESCRUB: TStringField;
    Label5: TLabel;
    CmbPlano: TwwDBLookupCombo;
    qryPlano: TwwQuery;
    qryPlanoIDPLANOPREV: TFloatField;
    qryPlanoNOME: TStringField;
    qryIDASSUNTO: TFloatField;
    qryIDTIPOPROCESSO: TFloatField;
    qryIDGRUPOASSUNTO: TFloatField;
    qryIDCONFIGRUBS: TFloatField;
    qryNOME: TStringField;
    qryIDPLANOPREV: TFloatField;
    qryFLGCHAMAEMPRESTIM: TFloatField;
    QryBeneficio: TwwQuery;
    QryBeneficioIDSERVICOS: TFloatField;
    QryBeneficioNOME: TStringField;
    DSBeneficio: TwwDataSource;
    dblkBeneficio: TwwDBLookupCombo;
    Label6: TLabel;
    qryIDSERVBENEF: TFloatField;
    Label7: TLabel;
    QryWebPagina: TwwQuery;
    QryWebPaginaIDPAGINA: TFloatField;
    QryWebPaginaDESCPAGINA: TStringField;
    DSWebPagina: TwwDataSource;
    qryIDPAGINA: TFloatField;
    wwDBLookupCombo1: TwwDBLookupCombo;
    Label8: TLabel;
    dbcboEventoEmprestimo: TwwDBComboBox;
    Label9: TLabel;
    Label10: TLabel;
    procedure BtnSelRespostaClick(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadAssunto: TfrmCadAssunto;

implementation

Uses uDataBase, umoduloCap, FPrincipal;

{$R *.DFM}

procedure TfrmCadAssunto.CmeDetalheConfirma(Sender: TObject);
Begin
  If qryDetDESCRESPATEN.IsNull Then
     showmessage('Não foi informada a resposta padrão.')
  Else
     Inherited;
End;

procedure TfrmCadAssunto.CmeCadastroDelete(Sender: TObject);
Begin
   Inherited;
   QryDet.First;
   While Not QryDet.Eof Do
         QryDet.Delete;
End;

procedure TfrmCadAssunto.CmeCadastroConfirma(Sender: TObject);
Begin
  if not Sistema.GravaLogOperacoes('Operação de Cadastro de Assuntos') then
  begin
    Raise Exception.Create('Não foi possível Gravar o Log');
    exit;
  end;

   If CmeCadastro.Operacao In ([OpInserir, OpAlterar]) Then
      AplicaAlteracoes([Qry,QryDet])
   Else
      AplicaAlteracoes([QryDet,Qry])

End;

Procedure TfrmCadAssunto.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
   Accept := modulocap.VerificaLinhaGrid(QryDet,2,2,'Respostas Padrão',False);

   if trim(dblkBeneficio.text) = '' then
     qry.fieldByName('IDSERVBENEF').Clear;

   if (Trim(ednome.text) = '') then
   begin
     showmessage('É preciso preencher o nome do assunto !');
     If ednome.CanFocus Then ednome.SetFocus;
     Accept := False
   end
   Else
      if (Trim(CmbGrupoAssunto.text) = '') then
      begin
        showmessage('É preciso indicar o grupo do assunto !');
        If CmbGrupoAssunto.CanFocus Then CmbGrupoAssunto.SetFocus;
        Accept := False
      end
      Else
        Accept := (Accept and True);
End;

procedure TfrmCadAssunto.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qryidassunto.AsInteger := LeUltRegistro(nil,'ASSUNTO') ;

  If ednome.CanFocus Then ednome.SetFocus;

  with qrydet do
  Begin
     If Active then Close;

     Params[0].AsFloat := qryIDASSUNTO.AsFloat;
     Open;
  End;
end;

procedure TfrmCadAssunto.CmeDetalheInsert(Sender: TObject);
begin
  Inherited;
  QryDetIDASSUNTOXRESP.AsFloat := LeUltRegistro(nil,'ASSUNTOXRESP') ;
  QryDetIDASSUNTO.AsFloat := qryidassunto.AsInteger;
End;

procedure TfrmCadAssunto.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  If ednome.CanFocus Then ednome.SetFocus;
end;

procedure TfrmCadAssunto.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  Begin
     with qry do
     Begin
        If Active then Close;

        Params[0].AsFloat := StrToFloat(MontaSelect.ValoresChave[0]);
        Open;
     End;

     with qrydet do
     Begin
        If Active then Close;

        Params[0].AsFloat := qryIDASSUNTO.AsFloat;
        Open;
     End;
  End;
end;

procedure TfrmCadAssunto.BtnSelRespostaClick(Sender: TObject);
begin
  inherited;
  MsResposta.Executar;
  If MsResposta.RetornouValor Then
  Begin
    qryDetDESCRESPATEN.AsString := MsResposta.ValoresChave[0];
    QryDetIDRESPATEND.AsInteger := StrToInt(MsResposta.ValoresChave[1]);
  End
  Else
  Begin
    qryDetDESCRESPATEN.Clear;
    QryDetIDRESPATEND.Clear;
  End;
end;

procedure TfrmCadAssunto.FormCreate(Sender: TObject);
begin
  inherited;
  QryBeneficio.Open;
  QryWebPagina.Open;
end;

end.
