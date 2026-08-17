unit FCadCamposVincValores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGrid, cmseldlg, wwidlg, Db, Wwdatsrc, IvDictio, IvMulti,
  IvEMulti, TB97Ctls, MAHlpBtn, DBCtrls, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, DBTables, Wwquery,
  CmEventosCadastro, wwDialog, ImgList;

type
  TfrmCadCamposVincValores = class(TfrmCadastroGrid)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    qryPrincipal: TwwQuery;
    Label4: TLabel;
    DBEdtValorArquivo: TDBEdit;
    Label5: TLabel;
    DBEdtValorSistema: TDBEdit;
    DBLkpCmbBxValorSistema: TDBLookupComboBox;
    UpdtSQLPrincipal: TUpdateSQL;
    qryAux: TwwQuery;
    qryVerificaValor: TQuery;
    qryCampoLookup: TwwQuery;
    dsCampoLookup: TwwDataSource;
    dsLookupAssoc: TwwDataSource;
    qryLookupAssoc: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryPrincipalBeforePost(DataSet: TDataSet);
    procedure qryPrincipalAfterPost(DataSet: TDataSet);
    procedure qryPrincipalAfterDelete(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCamposVincValores: TfrmCadCamposVincValores;


implementation

uses FCadLayoutArquivo, uValidaValorCampo;

{$R *.DFM}

procedure TfrmCadCamposVincValores.FormShow(Sender: TObject);
begin
  //Herança
  inherited;

  //Verificar se campo esta vinculado a um FK
  qryCampoLookup.Open;
  if not qryCampoLookup.FieldByname('NO_TABELA').IsNull Then
     Begin
       // Seta Query ComboBox
       With qryLookupAssoc Do
         Begin
           DisableControls;
           Close;
           SQL.Clear;
           If qryCampoLookup.FieldByName('TIPO_CAMPO').AsString = 'N' Then // Chave Numérica
              SQL.Add('SELECT TO_CHAR(' + qryCampoLookUp.FieldByName('NO_CHAVE').AsString + ') NO_CHAVE,')
           Else
              SQL.Add('SELECT ' + qryCampoLookUp.FieldByName('NO_CHAVE').AsString + ' NO_CHAVE,');
           SQL.Add(qryCampoLookUp.FieldByName('NO_CAMPO').AsString + ' NO_CAMPO');
           SQL.Add('FROM ' +  qryCampoLookUp.FieldByName('NO_TABELA').AsString);
           Try
             Open;
           Except on E: Exception do
             MessageDlg(E.Message, mtError, [mbOk], 0);
           End;
           EnableControls;
         End;
       // Seta Query Principal
       With qryPrincipal Do
         Begin
           Close;
           sql.Clear;
           sql.add('SELECT A.NO_TABELA, A.NO_ATRIBUTO_TABELA, A.CD_ARQUIVO, A.SQ_CAMPO, A.SQ_VALOR, A.VL_ARQUIVO, A.VL_ATRIBUIDO,');
           sql.add('B.' + qryCampoLookUp.FieldByName('NO_CAMPO').AsString + ' NO_CAMPO');
           sql.add('FROM FI_LAYOUT_ARQUIVO_TABELA_VALOR A, ' + qryCampoLookUp.FieldByName('NO_TABELA').AsString + ' B');
           sql.add('WHERE A.VL_ATRIBUIDO = ' + 'B.' + qryCampoLookUp.FieldByName('NO_CHAVE').AsString);
           sql.add('AND   A.NO_TABELA    = ' + #39 + frmCadLayoutArquivo.qryDetalheVinc.FieldByName('NO_TABELA').AsString + #39);
           sql.add('AND   A.NO_ATRIBUTO_TABELA = ' + #39 + frmCadLayoutArquivo.qryDetalheVinc.FieldByName('NO_ATRIBUTO_TABELA').AsString + #39);
           sql.add('AND   A.CD_ARQUIVO   = ' + inttostr(frmCadLayoutArquivo.qryDetalheVinc.FieldByName('CD_ARQUIVO').AsInteger));
           sql.add('AND   A.SQ_CAMPO     = ' + inttostr(frmCadLayoutArquivo.qryDetalheVinc.FieldByName('SQ_CAMPO').AsInteger));
           Open;
         End;
       // Seta Campos de Valoes
       DBLkpCmbBxValorSistema.KeyField := 'NO_CHAVE';
       DBLkpCmbBxValorSistema.ListField := 'NO_CAMPO';
       DBLkpCmbBxValorSistema.Refresh;
       DBLkpCmbBxValorSistema.Visible := True;
       DBEdtValorSistema.Visible := False;
     End
  Else
     Begin
       // Seta Query Principal
       With qryPrincipal Do
         Begin
           Close;
           sql.Clear;
           sql.add('SELECT NO_TABELA, NO_ATRIBUTO_TABELA, CD_ARQUIVO, SQ_CAMPO, SQ_VALOR, VL_ARQUIVO, ');
           sql.add('VL_ATRIBUIDO, VL_ATRIBUIDO NO_CAMPO');
           sql.add('FROM FI_LAYOUT_ARQUIVO_TABELA_VALOR');
           sql.add('WHERE NO_TABELA = ' + #39 + frmCadLayoutArquivo.qryDetalheVinc.FieldByName('NO_TABELA').AsString + #39);
           sql.add('AND   NO_ATRIBUTO_TABELA = ' + #39 + frmCadLayoutArquivo.qryDetalheVinc.FieldByName('NO_ATRIBUTO_TABELA').AsString + #39);
           sql.add('AND   CD_ARQUIVO = ' + inttostr(frmCadLayoutArquivo.qryDetalheVinc.FieldByName('CD_ARQUIVO').AsInteger));
           sql.add('AND   SQ_CAMPO   = ' + inttostr(frmCadLayoutArquivo.qryDetalheVinc.FieldByName('SQ_CAMPO').AsInteger));
           Open;
         End;
       // Seta Campos de Valoes
       DBEdtValorSistema.Visible := True;
       DBLkpCmbBxValorSistema.Visible := False;
     End;
end;

procedure TfrmCadCamposVincValores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPrincipal.Close;
  qryCampoLookup.Close;
  qryLookupAssoc.Close;
end;

procedure TfrmCadCamposVincValores.qryPrincipalBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  // Verifica se inserção
  If qryPrincipal.State = dsInsert Then
     Begin
       qryPrincipal.FieldByName('NO_TABELA').AsString :=
       frmCadLayoutArquivo.qryDetalheVinc.FieldByName('NO_TABELA').AsString;

       qryPrincipal.FieldByName('NO_ATRIBUTO_TABELA').AsString :=
       frmCadLayoutArquivo.qryDetalheVinc.FieldByName('NO_ATRIBUTO_TABELA').AsString;

       qryPrincipal.FieldByName('CD_ARQUIVO').AsInteger :=
       frmCadLayoutArquivo.qryDetalheVinc.FieldByName('CD_ARQUIVO').AsInteger;

       qryPrincipal.FieldByName('SQ_CAMPO').AsInteger :=
       frmCadLayoutArquivo.qryDetalheVinc.FieldByName('SQ_CAMPO').AsInteger;

       //Busca Next Key
       qryAux.SQL.Clear;
       qryAux.SQL.Add('SELECT MAX(SQ_VALOR) SQ_VALOR FROM FI_LAYOUT_ARQUIVO_TABELA_VALOR');
       qryAux.SQL.Add('WHERE NO_TABELA = ' + #39 + qryPrincipal.FieldByName('NO_TABELA').AsString + #39);
       qryAux.SQL.Add('  AND NO_ATRIBUTO_TABELA = ' + #39 + qryPrincipal.FieldByName('NO_ATRIBUTO_TABELA').AsString + #39);
       qryAux.SQL.Add('  AND CD_ARQUIVO = ' + qryPrincipal.FieldByName('CD_ARQUIVO').AsString);
       qryAux.SQL.Add('  AND SQ_CAMPO   = ' + qryPrincipal.FieldByName('SQ_CAMPO').AsString);
       qryAux.Open;
       QryPrincipal.FieldByName('SQ_VALOR').AsInteger :=
       qryAux.FieldByName('SQ_VALOR').asInteger + 1;
       qryAux.Close;
     End;
end;

procedure TfrmCadCamposVincValores.qryPrincipalAfterPost(
  DataSet: TDataSet);
begin
  try
   qryPrincipal.ApplyUpdates;
   qryPrincipal.CommitUpdates;
   qryPrincipal.Close;
   qryPrincipal.Open;
  except
   bbtnCancelar.Click;
   exit;
  end;
end;

procedure TfrmCadCamposVincValores.qryPrincipalAfterDelete(
  DataSet: TDataSet);
begin
  qryPrincipal.ApplyUpdates;
  qryPrincipal.CommitUpdates;
end;

procedure TfrmCadCamposVincValores.bbtnConfirmarClick(Sender: TObject);
Var wCampo : TValidaValorCampo;
begin

  // Verifica se inserção
  If qryPrincipal.FieldByName('VL_ATRIBUIDO').IsNull Then
     Begin
       ShowMessage('Informe o valor a ser atribuído para o campo');
       Exit;
     End;

  // Se definido valor Defalt para o campo
  If (qryPrincipal.FieldByName('VL_ARQUIVO').IsNull)
  or (qryPrincipal.FieldByName('VL_ARQUIVO').AsString = '') Then
     Begin
       // Verifica se existe valor Default para o campo
       if qryPrincipal.State = dsInsert Then
          Begin
            qryAux.SQL.Clear;
            qryAux.SQL.Add('SELECT VL_ARQUIVO FROM FI_LAYOUT_ARQUIVO_TABELA_VALOR');
            qryAux.SQL.Add('WHERE NO_TABELA = ' + #39 + frmCadLayoutArquivo.qryDetalheVinc.FieldByName('NO_TABELA').AsString + #39);
            qryAux.SQL.Add('  AND NO_ATRIBUTO_TABELA = ' + #39 + frmCadLayoutArquivo.qryDetalheVinc.FieldByName('NO_ATRIBUTO_TABELA').AsString + #39);
            qryAux.SQL.Add('  AND CD_ARQUIVO = ' + frmCadLayoutArquivo.qryDetalheVinc.FieldByName('CD_ARQUIVO').AsString);
            qryAux.SQL.Add('  AND SQ_CAMPO   = ' + frmCadLayoutArquivo.qryDetalheVinc.FieldByName('SQ_CAMPO').AsString);
            qryAux.SQL.Add('  AND VL_ARQUIVO IS NULL');
            qryAux.Open;
            if not qryAux.IsEmpty Then
               Begin
                 ShowMessage('Já existe um valor padrão definido para o campo. Caso queira informar outros valores será necessário preencher o campo "Valor do campo no arquivo"!');
                 Exit;
               End;
          End;

     End
  Else
     Begin
       if qryCampoLookup.FieldByname('NO_TABELA').IsNull Then
          Begin
            //Isntancia Rotina para validação do valor atribuído ao campo
            wCampo := TValidaValorCampo.Create;

            if not wCampo.Valor_Definido_Valido (
               frmCadLayoutArquivo.qryDetalheVinc.FieldByName('TP_ATRIBUTO').AsString,
               frmCadLayoutArquivo.qryDetalheVinc.FieldByName('NR_TAM_ATRIBUTO_TABELA').AsInteger,
               qryPrincipal.FieldByName('VL_ATRIBUIDO').AsString  ) Then
               Begin
                 ShowMessage('valor atribuído incompatível com a natureza do campo!');
                 wCampo.Free;
                 Exit;
               End;

            wCampo.Free;
          End;
     End;
     
  // Grava Atualizações
  inherited;

end;

end.
