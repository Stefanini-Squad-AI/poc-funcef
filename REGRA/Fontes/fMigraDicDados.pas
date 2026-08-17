unit fMigraDicDados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwdatsrc, Wwquery, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, ComCtrls;

type
  TfrmMigraDicDados = class(TfrmOkCancelar)
    QryTable: TwwQuery;
    dsTable: TwwDataSource;
    QryField: TwwQuery;
    dsField: TwwDataSource;
    updField: TUpdateSQL;
    updTable: TUpdateSQL;
    QryTableAux: TwwQuery;
    rcMigra: TRichEdit;
    QrySeqTab: TwwQuery;
    QrySeqTabIDDDTABLE: TFloatField;
    QrySeqCmp: TwwQuery;
    QrySeqCmpIDDDFIELD: TFloatField;
    QryUpd: TwwQuery;
    QrySeqCmpIDDDTABLE: TFloatField;
    QrySeqTabTABLENAME: TStringField;
    QrySeqCmpFIELDNAME: TStringField;
    QryUpd2: TwwQuery;
    procedure dsTableDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure TrataGravaDados(Tabela, Campo, Tipo, DescTable, DescField : String; Tamanho : LongInt);
    procedure ApagaDicionario;
    procedure ApagaLixo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMigraDicDados: TfrmMigraDicDados;

implementation

uses fAguarde, UDatabase;

{$R *.DFM}

procedure TfrmMigraDicDados.dsTableDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  with QryField do begin
       Close;
       ParambyName('ID').AsInteger := QryTable.FieldbyName('IDDDTABLE').AsInteger;
       Open;
  end;
end;

procedure TfrmMigraDicDados.FormCreate(Sender: TObject);
begin
  inherited;

  QryTable.Close;
  QryTable.Prepare;

  QryField.Close;
  QryField.Prepare;
end;

procedure TfrmMigraDicDados.bbtnConfirmarClick(Sender: TObject);
var
   vComFld, vComTab, vTab, vCmp, vTip : String;
   vTam : LongInt;
begin
  inherited;

  if MessageDlg( 'Deseja apagar o Dicionário de Dados da Instância ?',mtConfirmation, [mbYes, mbNo],0) = mrYes then
     ApagaDicionario;

  if MessageDlg( 'Confirma Migração de Dados do Dicionario de Dados do Oracle '+
                 'para o Dicionário de Dados CM ?',mtConfirmation, [mbYes, mbNo],0) = mrYes then
  begin
       frmAguarde.Mostra('Abrindo Tabelas ...');
       frmAguarde.Refresh;

       QryTableAux.Close;
       QryTableAux.Open;

       QryTable.Close;
       QryTable.Open;

       QryField.Close;
       QryField.Open;

       QrySeqTab.Close;
       QrySeqTab.Open;

       QrySeqCmp.Close;
       QrySeqCmp.Open;

       rcMigra.Lines.Clear;
       frmAguarde.Pos := 0;
       frmAguarde.Max := QryTableAux.RecordCount;
       frmAguarde.Min := 0;

       QryTableAux.First;
       while not QryTableAux.EOF do begin
             vTab := QryTableAux.FieldbyName('TABLE_NAME').AsString;
             vCmp := QryTableAux.FieldbyName('COLUMN_NAME').AsString;
             vTip := QryTableAux.FieldbyName('DATA_TYPE').AsString;
             vTam := QryTableAux.FieldbyName('DATA_LENGTH').AsInteger;
             vComFld := QryTableAux.FieldbyName('DESCFIELD').AsString;
             vComTab := QryTableAux.FieldbyName('DESCTABLE').AsString;

             frmAguarde.Mostra('Migrando Tabela '+vTab);
             frmAguarde.Refresh;

             TrataGravaDados(vTab, vCmp, vTip, vComTab, vComFld, vTam);

             frmAguarde.Pos := frmAguarde.Pos + 1;
             frmAguarde.Refresh;
             QryTableAux.Next;
       end;
       frmAguarde.Apaga;

       ApagaLixo; //Limpado a tabela ddTable os registro que não possuem filhos em ddfield (Campos)
  end;
end;

Procedure TfrmMigraDicDados.TrataGravaDados(Tabela, Campo, Tipo, DescTable, DescField : String; Tamanho : LongInt);
var
   VIdTab, vIdCmp : LongInt;
   vAux : String;
   InsCmp, InsTab : Boolean;
begin
     with QryTable do begin
          Close;
          ParambyName('TABELA').AsString := Tabela;
          Open;
     end;

     if QryTable.IsEmpty then begin
        vAux := frmAguarde.lblMensagem.Caption;

        //Achando o sequence correto caso o mesmo esteja desatualizado
        vIdTab := LeUltRegistro(nil, 'DDTABLE');
        while QrySeqTab.Locate('IDDDTABLE',vIdTab,[]) do begin
              frmAguarde.Mostra('Selecionando Sequence ... (DDTABLE)');
              frmAguarde.Refresh;
              vIdTab := LeUltRegistro(nil, 'DDTABLE');
        end;

        //Achando o sequence correto caso o mesmo esteja desatualizado
        vIdCmp := LeUltRegistro(nil, 'DDFIELD');
        while QrySeqCmp.Locate('IDDDFIELD',vIdCmp,[]) do begin
              frmAguarde.Mostra('Selecionando Sequence ... (DDFIELD)');
              frmAguarde.Refresh;
              vIdCmp := LeUltRegistro(nil, 'DDFIELD');
        end;

        frmAguarde.Mostra(vAux);
        frmAguarde.Refresh;

        InsTab := True;
        InsCmp := True;
     end else begin
         vIdTab := QryTable.FieldbyName('IDDDTABLE').AsInteger;

         with QryField do begin
              Close;
              ParambyName('ID').AsInteger := vIdTab;
              ParambyName('CAMPO').AsString := Campo;
              Open;
         end;
         InsTab := False; 


         if QryField.IsEmpty then begin
            vAux := frmAguarde.lblMensagem.Caption;

            //Achando o sequence correto caso o mesmo esteja desatualizado
            vIdCmp := LeUltRegistro(nil, 'DDFIELD');
            while QrySeqCmp.Locate('IDDDFIELD',vIdCmp,[]) do begin
                  frmAguarde.Mostra('Selecionando Sequence ... (DDFIELD)');
                  frmAguarde.Refresh;
                  vIdCmp := LeUltRegistro(nil, 'DDFIELD');
            end;

            frmAguarde.Mostra(vAux);
            frmAguarde.Refresh;
            InsCmp := True;
         end else begin
             vIdCmp := QryField.FieldbyName('IDDDFIELD').AsInteger;
             InsCmp := False;
         end;
     end;

     if InsTab then QryTable.Insert
        else QryTable.Edit;
     QryTable.FieldbyName('IDDDTABLE').AsInteger := vIdTab;
     QryTable.FieldbyName('TABLENAME').AsString := Tabela;
     QryTable.FieldbyName('TABLEALIAS').AsString := Tabela;
     QryTable.FieldbyName('DESCRICAO').AsString := DescTable;
     try
        QryTable.Post;
        QryTable.ApplyUpdates;
     except
           rcMigra.Lines.Add('Não foi possivel gravar Tabela '+Tabela);
     end;

     if InsCmp then
        QryField.Insert
     else
         QryField.Edit;

     QryField.FieldbyName('IDDDTABLE').AsInteger := vIdTab;
     QryField.FieldbyName('IDDDFIELD').AsInteger := vIdCmp;
     QryField.FieldbyName('FIELDNAME').AsString := Campo;
     QryField.FieldbyName('FIELDALIAS').AsString := Campo;
     QryField.FieldbyName('TIPODEDADO').AsString := Tipo;
     QryField.FieldbyName('TAMANHO').AsInteger := Tamanho;
     QryField.FieldbyName('CAMPODOBANCO').AsInteger := 1;
     QryField.FieldbyName('CHAVE').AsInteger := 0;
     QryField.FieldbyName('DESCRICAO').AsString := DescField;

     //Falta tratamento para o campo TIPOCHAVE - Aguardar o Gustavão
     if Tipo = 'MEMO' then begin
        QryField.FieldbyName('SELECTABLE').AsInteger := 0;
        QryField.FieldbyName('SEARCHABLE').AsInteger := 0;
        QryField.FieldbyName('SORTABLE').AsInteger := 0;
     end else begin
        QryField.FieldbyName('SELECTABLE').AsInteger := 1;
        QryField.FieldbyName('SEARCHABLE').AsInteger := 1;
        QryField.FieldbyName('SORTABLE').AsInteger := 1;
     end;

     try
        QryField.Post;
        QryField.ApplyUpDates;
     except
           rcMigra.Lines.Add('Não foi possivel gravar Campo '+Campo+' da Tabela '+Tabela);
     end;

     if InsTab then begin
        QrySeqTab.Close;
        QrySeqTab.Open;
     end;

     if InsCmp then begin
        QrySeqCmp.Close;
        QrySeqCmp.Open;
     end;
end;


procedure TfrmMigraDicDados.ApagaDicionario;
var
   vSql : String;
begin
     frmAguarde.Mostra('Abrindo Tabelas ...');
     frmAguarde.Refresh;

     QryTableAux.Close;
     QryTableAux.Open;

     QryTable.Close;
     QryTable.Open;

     QryField.Close;
     QryField.Open;

     QrySeqTab.Close;
     QrySeqTab.Open;

     QrySeqCmp.Close;
     QrySeqCmp.Open;

     frmAguarde.Pos := 0;
     frmAguarde.Min := 0;
     frmAguarde.Max := QrySeqCmp.RecordCount + QrySeqTab.RecordCount;

     frmAguarde.Mostra('Apagando Dicionário de Dados ');
     frmAguarde.Refresh;
     QrySeqCmp.First;
     while not QrySeqCmp.Eof do begin
           with QryUpd do begin
                Close;
                Sql.Clear;
                vSql := 'DELETE FROM DDFIELD WHERE IDDDFIELD = '+QrySeqCmp.FieldbyName('IDDDFIELD').AsString+
                        ' AND IDDDTABLE = '+QrySeqCmp.FieldbyName('IDDDTABLE').AsString;
                Sql.Add(vSql);
                try
                   ExecSql;
                except
                      rcMigra.Lines.Add( 'Não foi possível excluir campo '+QrySeqCmp.FieldbyName('FIELDNAME').AsString);
                end;
           end;
           frmAguarde.Pos := frmAguarde.Pos + 1;
           frmAguarde.Refresh;
           QrySeqCmp.Next;
     end;

     QrySeqTab.First;
     while not QrySeqTab.Eof do begin
           with QryUpd do begin
                Close;
                Sql.Clear;
                vSql := 'DELETE FROM DDTABLE WHERE IDDDTABLE = '+QrySeqTab.FieldbyName('IDDDTABLE').AsString;
                Sql.Add(vSql);
                try
                   ExecSql;
                except
                      rcMigra.Lines.Add( 'Não foi possível excluir tabela '+QrySeqTab.FieldbyName('TABLENAME').AsString);
                end;
           end;
           frmAguarde.Pos := frmAguarde.Pos + 1;
           frmAguarde.Refresh;
           QrySeqTab.Next;
     end;
     frmAguarde.Apaga;
end;


procedure TfrmMigraDicDados.ApagaLixo;
begin
     frmAguarde.Mostra('Finalizando Migração ...');
     frmAguarde.Refresh;

     with QryUpd do begin
          Close;
          Sql.Clear;
          Sql.Add('SELECT T.IDDDTABLE, T.TABLENAME, F.IDDDFIELD FROM DDTABLE T, DDFIELD F WHERE ');
          Sql.Add('T.IDDDTABLE = F.IDDDTABLE(+) AND F.IDDDFIELD IS NULL');
          Open;
     end;
     frmAguarde.Pos := 0;
     frmAguarde.Min := 0;
     frmAguarde.Max := QryUpd.RecordCount;

     while not QryUpd.Eof do begin
           with QryUpd2 do begin
                Close;
                Sql.Clear;
                Sql.Add('DELETE FROM DDTABLE WHERE IDDDTABLE = '+QryUpd.FieldbyName('IDDDTABLE').AsString);
                try
                   ExecSql;
                except
                      rcMigra.Lines.Add( 'Não foi possível excluir (Lixo) tabela '+QryUpd.FieldbyName('TABLENAME').AsString);
                end;
           end;
           frmAguarde.Pos := frmAguarde.Pos + 1;
           frmAguarde.Refresh;
           QryUpd.Next;
     end;
     frmAguarde.Apaga;
end;


end.
