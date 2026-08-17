// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Gleyber
// Data        : 05/04/2004
// Pendencia   : 16369
// Rotina      : qryDet
// Alteração   : Retirado a referência ao campo "CAMPO" na PARAMENVIO.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 22/12/2003
// Pendencia   : 15833
// Rotina      : bbtnOkDetClick
// Alteração   : Incluído a rotina do sequence para quando este não executado
//               antes de confirmar o mestre.
//               Alterado também o UPDDET para alterar a chave primária.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 16/12/2003
// Pendencia   : 15814
// Alteração   : Acerto nos campos FLGHEADER e FLGFOOTER - Acertar para gravar
//               'S' e não '1' 
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 13.11.2003
// Pendencia   :
// Alteração   : Acertar marcação automática do campo ORDEM
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 08.10.2003
// Pendencia   : 14952
// Alteração   : Permitir apenas exibição/inserção de lay-out do tipo ENVIO
//------------------------------------------------------------------------------
unit FCadLayOutRecebimentoPatro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, Mask, wwdbedit, wwdblook, CMDBLookupCombo,
  TREdit, Wwdotdot, Wwdbcomb, DBCtrls, uCMTypes, UDataBase ;

type
  TfrmCadLayOutRecebimentoPatro = class(TfrmCadMestreDetalheCS)
    Label1: TLabel;
    DbeDescricao: TwwDBEdit;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    pnlControles: TPanel;
    Ordem: TLabel;
    Tipo: TLabel;
    Label4: TLabel;
    Tamanho: TLabel;
    Label5: TLabel;
    Formato: TLabel;
    Label10: TLabel;
    dblookupTipo: TwwDBComboBox;
    dbDescricao: TwwDBEdit;
    dbFormato: TwwDBEdit;
    dbConteudo: TwwDBEdit;
    dbTamanho: TDBRealEdit;
    dbOrdem: TDBRealEdit;
    dblookupCampo: TCMDBLookupCombo;
    qryCampos: TwwQuery;
    qryCamposIDCAMPO: TFloatField;
    qryCamposNOME: TStringField;
    qryAux: TwwQuery;
    dbckValor: TDBCheckBox;
    dbckSeparador: TDBCheckBox;
    qryOpcaoSalario: TwwQuery;
    qryOpcaoRegDuplicado: TwwQuery;
    qryOpcaoGravaHistRub: TwwQuery;
    tbsOpcoes: TTabSheet;
    Label7: TLabel;
    dblkpcmbOpcaoRegDuplicado: TCMDBLookupCombo;
    Label8: TLabel;
    CMDBLookupCombo1: TCMDBLookupCombo;
    dbcRubricaAtraso: TDBCheckBox;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    dblkpOpcaoSalario: TCMDBLookupCombo;
    gbTipoDec: TGroupBox;
    lblNumDec: TLabel;
    dbrgTipoDec: TDBRadioGroup;
    dbreNumDec: TDBRealEdit;
    dbgrpChave: TDBRadioGroup;
    rdgrpOpMat: TDBRadioGroup;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure dbTamanhoExit(Sender: TObject);
    procedure dbckValorClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure dbOrdemExit(Sender: TObject);
  private
    { Private declarations }
    iMaiorOrdem : integer; 
  public
    { Public declarations }
  end;

var
  frmCadLayOutRecebimentoPatro: TfrmCadLayOutRecebimentoPatro;

implementation

uses UMensErro, UAdmPrev;

{$R *.DFM}

procedure TfrmCadLayOutRecebimentoPatro.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('IDLAYOUTENVIO').AsInteger  := -1;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDLAYOUTENVIO').AsInteger := -1;
  qryDet.Open;

  qryCampos.Close;
  qryCampos.Open;

  qryOpcaoSalario.Close;
  qryOpcaoSalario.Open;

  qryOpcaoRegDuplicado.Close;
  qryOpcaoRegDuplicado.Open;

  qryOpcaoGravaHistRub.Close;
  qryOpcaoGravaHistRub.Open;

end;

procedure TfrmCadLayOutRecebimentoPatro.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if not MontaSelect.RetornouValor then Exit;
  qry.Close;
  qry.ParamByName('IDLAYOUTENVIO').AsInteger   := StrToInt(MontaSelect.ValoresChave[0]);
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDLAYOUTENVIO').AsInteger   := StrToInt(MontaSelect.ValoresChave[0]);
  qryDet.Open;

  qryDet.Last;
  iMaiorOrdem := qryDet.FieldByName('ORDEM').AsInteger+1; 
end;

procedure TfrmCadLayOutRecebimentoPatro.CmeDetalheInsert(Sender: TObject);
begin
  inherited;

  If qryDet.FieldByName('FLGVALOR').IsNull
    Then qryDet.FieldByName('FLGVALOR').AsInteger := 0;

  If qryDet.FieldByName('FLGSEPARADOR').IsNull
    Then qryDet.FieldByName('FLGSEPARADOR').AsInteger := 0;

  qryDet.FieldByName('ORDEM').AsInteger := iMaiorOrdem; 
end;

procedure TfrmCadLayOutRecebimentoPatro.CmeDetalheEdit(Sender: TObject);
begin
  inherited;

  If qryDet.FieldByName('FLGVALOR').IsNull
    Then qryDet.FieldByName('FLGVALOR').AsInteger := 0;

  If qryDet.FieldByName('FLGSEPARADOR').IsNull
    Then qryDet.FieldByName('FLGSEPARADOR').AsInteger := 0;
end;

procedure TfrmCadLayOutRecebimentoPatro.dbTamanhoExit(Sender: TObject);
var i : word;
begin
  inherited;
  //Verificar e alterar o valor do campo "CONTEUDO" só se a Query estiver em modo de Inserção ou Edição;
  if qryDet.State in [dsInsert, dsEdit] then
   case dblookupTipo.ItemIndex of
   4: //zerados;
    begin
      for i := 1 to StrToInt(dbTamanho.Text) do
       qryDet.FieldByName('CONTEUDO').AsString := qryDet.FieldByName('CONTEUDO').AsString + '0';
    end;
   5: //noves;
    begin
      for i := 1 to StrToInt(dbTamanho.Text) do
       qryDet.FieldByName('CONTEUDO').AsString := qryDet.FieldByName('CONTEUDO').AsString + '9';
    end;
   6: //vazios;
    begin
      for i := 1 to StrToInt(dbTamanho.Text) do
       qryDet.FieldByName('CONTEUDO').AsString := qryDet.FieldByName('CONTEUDO').AsString + ' ';
    end;
   end;
end;

procedure TfrmCadLayOutRecebimentoPatro.dbckValorClick(Sender: TObject);
begin
  inherited;
  dbckSeparador.Visible := dbckValor.Checked;
end;

procedure TfrmCadLayOutRecebimentoPatro.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qryDet.Close;
  qryDet.ParamByName('IDLAYOUTENVIO').AsInteger := -1;
  qryDet.Open;

  iMaiorOrdem := 1; 
  DbeDescricao.SetFocus;
end;

procedure TfrmCadLayOutRecebimentoPatro.CmeCadastroConfirma(Sender: TObject);
begin

  { Criticas }
  If (CmeCadastro.Operacao = opInserir) Or (CmeCadastro.Operacao = opAlterar) Then Begin
    If DbeDescricao.Text = '' Then Begin
      MsgDlg('Descrição do Layout deve ser preenchido.','Erro',mtError,[mbOK],0);
      DbeDescricao.SetFocus;
      Exit;
    End;
  End;

  { Gera Identificador }
  If (CmeCadastro.Operacao = opInserir) And
     (qry.FieldByName('IDLAYOUTENVIO').AsInteger=0)
   Then Begin
    Qry.FieldByName('IDLAYOUTENVIO').AsInteger := LeUltRegistro(qryaux, 'LAYOUTENVIO');
  End;

  inherited;

  If QryDet.UpdatesPending Then QryDet.ApplyUpdates;
end;

procedure TfrmCadLayOutRecebimentoPatro.bbtnOkDetClick(Sender: TObject);
begin

  { Criticas }
  if Trim(dbOrdem.Text) = '' then begin
     MsgDlg('O campo "Ordem" é obrigatório e não foi preenchido.','Erro',mtError,[mbOK],0);
     Exit;
  end;
  if Trim(dblookupCampo.Text) = '' then begin
     MsgDlg('O campo "Campo" é obrigatório e não foi preenchido.','Erro',mtError,[mbOK],0);
     Exit;
  end;
  if Trim(dblookupTipo.Text) = '' then begin
     MsgDlg('O campo "Tipo" é obrigatório e não foi preenchido.','Erro',mtError,[mbOK],0);
     Exit;
  end;
  if Trim(dbTamanho.Text) = '' then begin
     MsgDlg('O campo "Tamanho" é obrigatório e não foi preenchido.','Erro',mtError,[mbOK],0);
     Exit;
  end;
  if Trim(dbDescricao.Text) = '' then begin
     MsgDlg('O campo "Descrição" é obrigatório e não foi preenchido.','Erro',mtError,[mbOK],0);
     Exit;
  end;

  If (CmeCadastro.Operacao = opInserir) And
     (qry.FieldByName('IDLAYOUTENVIO').AsInteger=0)
   Then Begin
    Qry.FieldByName('IDLAYOUTENVIO').AsInteger := LeUltRegistro(qryaux, 'LAYOUTENVIO');
  End;

  qryDet.FieldByName('IDLAYOUTENVIO').AsInteger   := qry.FieldByName('IDLAYOUTENVIO').AsInteger;
  qryDet.FieldByName('CAMPO').AsString            := qryCampos.FieldByName('NOME').AsString;

  { Gera Identificador }
  If CmeDetalhe.Operacao = opInserir Then Begin
    qryDet.FieldByName('SEQUENCIA').AsInteger := LeUltRegistro(qryaux, 'PARAMENVIO');
  End;
  
  inherited;

end;

procedure TfrmCadLayOutRecebimentoPatro.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  qry.FieldByName('TIPO').AsString := 'R';
end;

procedure TfrmCadLayOutRecebimentoPatro.qryDetBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  qryDet.FieldByName('IDENTIFICADOR').AsInteger := 1; // so pode ter detalhe
  qryDet.FieldByName('LINHA').AsInteger         := 1; // so pode ter detalhe

  if qryDet.State = dsInsert then inc(iMaiorOrdem); 
end;

procedure TfrmCadLayOutRecebimentoPatro.dbOrdemExit(Sender: TObject);
begin
  inherited;
  if StrToInt(OraNumero(dbOrdem.Text)) > iMaiorOrdem 
  then iMaiorOrdem := StrToInt(OraNumero(dbOrdem.Text));
end;

end.
