// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Leo
// Data        : 09/05/2005
// Pendencia   :
// Alteração   : modificação na visualização do rdgrpcompletanum que não paarecia
//               automaticamente na alteração
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 09/05/2005
// Pendencia   : 18701
// Alteração   : retireo o acento de "Numérico" poir isso pode causar erro de banco ou SO
//               com outra opção de lingua
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 09/05/2005
// Pendencia   : 18701
// Alteração   : a implementação anterior não exibia a opção de completar com zeros
//               que é a opção default
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 17/03/2005
// Pendencia   : 18701
// Alteração   : Inclusão de um campo (FLGCOMPBRANCOS) que indicará, quando o campo
//               for numérico, que deve ser completado com brancos à esquerda.
//------------------------------------------------------------------------------
// Autor(a)    : Flavio Dias
// Data        : 17.05.2004
// Pendencia   : 16787
// Alteração   : Apresentação de consulta para formato de matrícula
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 10.05.2004
// Pendencia   : 16737
// Rotina      : updDet
// Alteração   : Gravação do IDLayOutEnvio
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 19/02/2004
// Pendencia   : 16125
// Rotina      : CmeCadastroInsert
// Alteração   : Erro no OK (Field TIPO not found)
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 13.11.2003
// Pendencia   :
// Alteração   : Erro no OK (Field TIPO not found)
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 08.10.2003
// Pendencia   : 14952
// Alteração   : Permitir apenas exibição/inserção de lay-out do tipo ENVIO
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 04/07/2003
// Pendencia   : 14561
// Alteração   : Alteração total de layout e funcionamento.
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 02.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FCadEnvioPatro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, Mask, wwdbedit, wwdblook, CMDBLookupCombo,
  TREdit, Wwdotdot, Wwdbcomb, DBCtrls, uCMTypes, UDataBase ;

type
  TfrmCadEnvioPatro = class(TfrmCadMestreDetalheCS)
    Label1: TLabel;
    DbeDescricao: TwwDBEdit;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    pnlControles: TPanel;
    Ordem: TLabel;
    Tipo: TLabel;
    Label4: TLabel;
    Tamanho: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Formato: TLabel;
    Label10: TLabel;
    dblookupTipo: TwwDBComboBox;
    dbIdentificador: TwwDBEdit;
    dbDescricao: TwwDBEdit;
    dbFormato: TwwDBEdit;
    dbLinha: TwwDBComboBox;
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
    btFormato: TButton;
    mmFormato: TMemo;
    rdgrpcompletanum: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure dbIdentificadorExit(Sender: TObject);
    procedure dbTamanhoExit(Sender: TObject);
    procedure dbckValorClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure mmFormatoExit(Sender: TObject);
    procedure btFormatoClick(Sender: TObject);
    procedure dblookupCampoChange(Sender: TObject);
    procedure dblookupTipoCloseUp(Sender: TwwDBComboBox; Select: Boolean);
    procedure sbtnAltDetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadEnvioPatro: TfrmCadEnvioPatro;

implementation

uses UMensErro, UAdmPrev;

{$R *.DFM}

procedure TfrmCadEnvioPatro.FormCreate(Sender: TObject);
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


  {
  sgFormato.Cells[0,0] := 'Formato';
  sgFormato.Cells[1,0] := 'Ação';
  sgFormato.Cells[0,1] := '9';
  sgFormato.Cells[1,1] := 'utiliza o próximo caracter numérico';
  sgFormato.Cells[0,2] := 'X';
  sgFormato.Cells[1,2] := 'utiliza o caracter atual';
  sgFormato.Cells[0,3] := '0';
  sgFormato.Cells[1,3] := 'não considera o caracter atual';
  sgFormato.Cells[0,4] := 'outro';
  sgFormato.Cells[1,4] := 'acrescenta o caracter especificado no formato, sem avançar o campo';
Formato  Ação
Exemplo:
Formato    Matrícula      Resultado
999990X  00100--  ==> 00100-
99999XX  00100--  ==> 00100--
99999-9    001008  ==> 00100-8}
end;

procedure TfrmCadEnvioPatro.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if not MontaSelect.RetornouValor then Exit;
  qry.Close;
  qry.ParamByName('IDLAYOUTENVIO').AsInteger   := StrToInt(MontaSelect.ValoresChave[0]);
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDLAYOUTENVIO').AsInteger   := StrToInt(MontaSelect.ValoresChave[0]);
  qryDet.Open;

end;

procedure TfrmCadEnvioPatro.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  dbLinha.SetFocus;
  If qryDet.FieldByName('FLGVALOR').IsNull
    Then qryDet.FieldByName('FLGVALOR').AsInteger := 0;

  If qryDet.FieldByName('FLGSEPARADOR').IsNull
    Then qryDet.FieldByName('FLGSEPARADOR').AsInteger := 0;
  //
end;

procedure TfrmCadEnvioPatro.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  dbLinha.SetFocus;
  If qryDet.FieldByName('FLGVALOR').IsNull
    Then qryDet.FieldByName('FLGVALOR').AsInteger := 0;

  If qryDet.FieldByName('FLGSEPARADOR').IsNull
    Then qryDet.FieldByName('FLGSEPARADOR').AsInteger := 0;
  //
  rdgrpcompletanum.Visible := (dblookupTipo.ItemIndex = 0);
end;

procedure TfrmCadEnvioPatro.dbIdentificadorExit(Sender: TObject);
begin
  inherited;
  //Este procedimento serve para buscar a última ordem para o campo que está sendo cadastrado.
  //Vale lembrar que este valor será atribuído apenas como default;

  if (Trim(dbIdentificador.Text) <> '') and
     (qryDet.State in [dsInsert])
  then begin //Só deverá buscar um valor se for inserção;
    with qryAux do
    begin
       Close;
       SQL.Clear;
       SQL.Add('SELECT   MAX(ORDEM) AS MAIOR');
       SQL.Add('FROM     PARAMENVIO');
       SQL.Add('WHERE    IDLAYOUTENVIO = ' + Qry.FieldByName('IDLAYOUTENVIO').AsString);
       SQL.Add('AND      IDENTIFICADOR = ''' + dbIdentificador.Text + '''');
       Open;

       if not IsEmpty
       then qryDet.FieldByName('ORDEM').AsInteger := FieldByName('MAIOR').AsInteger + 1;
       Close;
    end;
  end;

end;

procedure TfrmCadEnvioPatro.dbTamanhoExit(Sender: TObject);
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


procedure TfrmCadEnvioPatro.dbckValorClick(Sender: TObject);
begin
  inherited;
  dbckSeparador.Visible := dbckValor.Checked;
end;


procedure TfrmCadEnvioPatro.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qryDet.Close;
  qryDet.ParamByName('IDLAYOUTENVIO').AsInteger := -1;
  qryDet.Open;

  { Gera Identificador }
  Qry.FieldByName('IDLAYOUTENVIO').AsInteger := LeUltRegistro(qryaux, 'LAYOUTENVIO');

  DbeDescricao.SetFocus;
end;

procedure TfrmCadEnvioPatro.CmeCadastroConfirma(Sender: TObject);
begin

  { Criticas }
  If (CmeCadastro.Operacao = opInserir) Or (CmeCadastro.Operacao = opAlterar) Then Begin
    If DbeDescricao.Text = '' Then Begin
      MsgDlg('Descrição do Layout deve ser preenchido.','Erro',mtError,[mbOK],0);
      DbeDescricao.SetFocus;
      Exit;
    End;
  End;

  inherited;

  If QryDet.UpdatesPending Then QryDet.ApplyUpdates;
end;

procedure TfrmCadEnvioPatro.bbtnOkDetClick(Sender: TObject);
begin

  { Criticas }
  if Trim(dbLinha.Text) = '' then begin
     MsgDlg('O campo "Linha" é obrigatório e não foi preenchido.','Erro',mtError,[mbOK],0);
     Exit;
  end;
  if Trim(dbIdentificador.Text) = '' then begin
     MsgDlg('O campo "Identificador" é obrigatório e não foi preenchido.','Erro',mtError,[mbOK],0);
     Exit;
  end;
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

  qryDet.FieldByName('IDLAYOUTENVIO').AsInteger   := qry.FieldByName('IDLAYOUTENVIO').AsInteger;
  qryDet.FieldByName('CAMPO').AsString            := qryCampos.FieldByName('NOME').AsString;

  { Gera Identificador }
  If CmeDetalhe.Operacao = opInserir Then Begin
    qryDet.FieldByName('SEQUENCIA').AsInteger := LeUltRegistro(qryaux, 'PARAMENVIO');
  End;
  
  inherited;

end;

procedure TfrmCadEnvioPatro.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  qry.FieldByName('TIPO').AsString := 'E';

end;

procedure TfrmCadEnvioPatro.mmFormatoExit(Sender: TObject);
begin
  inherited;
  mmFormato.Visible := False;
  dbFormato.SetFocus;
end;

procedure TfrmCadEnvioPatro.btFormatoClick(Sender: TObject);
begin
  inherited;
  mmFormato.Visible := True;
  mmFormato.SetFocus;
end;

procedure TfrmCadEnvioPatro.dblookupCampoChange(Sender: TObject);
begin
  inherited;
  if qryCampos.FieldByName('IDCAMPO').AsInteger = 3 Then
     btFormato.Visible := True
  else
     btFormato.Visible := False;
end;

procedure TfrmCadEnvioPatro.dblookupTipoCloseUp(Sender: TwwDBComboBox;
  Select: Boolean);
begin
  inherited;
  rdgrpcompletanum.Visible := (dblookupTipo.ItemIndex = 0);
end;

procedure TfrmCadEnvioPatro.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  rdgrpcompletanum.Visible :=
  (pos('NUM', uppercase(Trim(qryDet.FieldByName('TIPO').AsString))) > 0);
end;

end.
