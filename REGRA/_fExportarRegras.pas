// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Daniel Begnami
// Data        :  23/10/2009
// Pendência   :  SOL 126014 KINTANA 655446
// Descrição   :  Erro na exportação das regras quando usado com o botão EXECUTAR OPÇOES:
//------------------------------------------------------------------------------
// Autor(a)    :Thiago Passos Silva
// Data        :  14/05/2009
// Pendência   :  SOL 117091 KINTANA 550761
// Descrição   :  Alteração de gravação de arquivos de log na raiz do disco C:
//------------------------------------------------------------------------------
// Autor(a)    :  Jéssica Lana
// Data        :  02/03/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descrição   :  Alteração de gravação de arquivos de log na raiz do disco C:
//------------------------------------------------------------------------------
unit fExportarRegras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, Wwdatsrc, DBTables, Wwquery, Wwtable, StdCtrls, Machklb,
  Grids, Wwdbigrd, Wwdbgrid, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, MontaSelect, BfDialogs, BrowseFolder,
  uProcuraDir, FileCtrl, ZipDir, ZipMstr, CheckLst, uSistema;

type
  TfrmExportarRegras = class(TfrmOkCancelar)
    Panel3: TPanel;
    dbgrRegra: TwwDBGrid;
    Panel1: TPanel;
    TabRegra: TwwTable;
    bmRegra: TBatchMove;
    QryRegra: TwwQuery;
    dsTabRegra: TwwDataSource;
    msRegras: TMontaSelect;
    msTipo: TMontaSelect;
    QrySelTipo: TwwQuery;
    tabFormula: TwwTable;
    QryFormula: TwwQuery;
    bm1: TBatchMove;
    bm2: TBatchMove;
    TabCmpBd: TwwTable;
    QryCmpBd: TwwQuery;
    QryCmpBdGrp: TwwQuery;
    bm3: TBatchMove;
    QryAlgregra: TwwQuery;
    tabAlgregra: TwwTable;
    bm5: TBatchMove;
    bm6: TBatchMove;
    QryTipoRegra: TwwQuery;
    QryGrpFormula: TwwQuery;
    tabTipoRegra: TwwTable;
    tabGrpFormula: TwwTable;
    bm7: TBatchMove;
    bm4: TBatchMove;
    TabGrpArquivo: TwwTable;
    QryGrpArquivo: TwwQuery;
    QryForm: TwwQuery;
    QryPai: TwwQuery;
    QryFilha: TwwQuery;
    QryRegraParadox: TwwQuery;
    LstAux: TListBox;
    TabCmpBdGrp: TwwTable;
    ZipMaster1: TZipMaster;
    QryPlique: TwwQuery;
    dsPlique: TwwDataSource;
    updPlique: TUpdateSQL;
    QryTodas: TwwQuery;
    bm8: TBatchMove;
    tabTodas: TwwTable;
    ds: TSaveDialog;
    Panel5: TPanel;
    chklstOpcoes: TCMchklistbox;
    Panel6: TPanel;
    btnCompactar: TButton;
    Panel4: TPanel;
    btnTodas: TBitBtn;
    btnRegras: TBitBtn;
    btnTiposRegras: TBitBtn;
    btnRemover: TBitBtn;
    BtnApagarTudo: TBitBtn;
    Panel2: TPanel;
    btnVerificar: TBitBtn;
    Bevel1: TBevel;
    Panel7: TPanel;
    procedure btnRegrasClick(Sender: TObject);
    procedure btnTiposRegrasClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnVerificarClick(Sender: TObject);
    procedure SelecionaFilha;
    procedure SelecionaForm;
    procedure SelecionaPai;
    procedure AbrirQuerysMontadas;
    procedure InsereLista(Texto : String);
    procedure BtnApagarTudoClick(Sender: TObject);
    procedure btnCompactarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnTodasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TabRegraAfterOpen(DataSet: TDataSet);
    procedure TabRegraAfterDelete(DataSet: TDataSet);
    procedure TabRegraAfterClose(DataSet: TDataSet);
    procedure TabRegraAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExportarRegras: TfrmExportarRegras;

implementation

uses fAguarde, uMensErro;

{$R *.DFM}

procedure TfrmExportarRegras.btnRegrasClick(Sender: TObject);
begin
  inherited;
  msRegras.Executar;
  Refresh;
  if msRegras.RetornouValor then begin
     frmAguarde.Mostra('Selecionando Regra');
     frmAguarde.Refresh;
     //Jésica Lana Nunes dos Santos SOL 109421 KINTANA 496332
     //if not fileexists('c:\temp\regra.db') then begin
       if not fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\regra.db') then begin

        with QryRegra do begin
             Close;
             ParambyName('ID').AsInteger := -1000;
             Open;
        end;
        bmRegra.Execute;
        TabRegra.Close;
        TabRegra.EmptyTable;
        TabRegra.Open;
     end;

     if not TabRegra.Active then
        TabRegra.Open;

     if not TabRegra.Locate('IDREGRA',msRegras.ValoresChave[0],[]) then begin
        TabRegra.Append;
        TabRegra.FieldByName('IDREGRA').AsString := msRegras.ValoresChave[0];
        TabRegra.FieldByName('NOMEREGRA').AsString := msRegras.ValoresChave[1];
        TabRegra.FieldByName('IDTIPOREGRA').AsString := msRegras.ValoresChave[2];
        TabRegra.FieldByName('DESCRICAOREGRA').AsString := msRegras.ValoresChave[3];
        TabRegra.FieldByName('PUBLICADA').AsString := msRegras.ValoresChave[4];
        TabRegra.FieldByName('DESCREGRA').AsString := msRegras.ValoresChave[5];
        TabRegra.FieldByName('OLDIDREGRA').AsString := msRegras.ValoresChave[6];
        TabRegra.Post;
     end else begin
         frmAguarde.Apaga;
         MsgDlg('Regra já selecionada.','Erro',mtConfirmation,[mbOk,mbHelp],0);
     end;
     frmAguarde.Apaga;
  end;

end;

procedure TfrmExportarRegras.btnTiposRegrasClick(Sender: TObject);
begin
  inherited;
  msTipo.Executar;
  Refresh;
  if msTipo.RetornouValor then begin
     frmAguarde.Mostra('Selecionando Regras');
     frmAguarde.Refresh;
     with QrySelTipo do begin
          Close;
          ParamByName('ID').AsInteger := StrtoInt(msTipo.ValoresChave[0]);
          Open;
     end;
     //Jésica Lana Nunes dos Santos SOL 109421 KINTANA 496332
     //if not fileexists('c:\temp\regra.db') then begin
     if not fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\regra.db') then begin

        QryRegra.Close;
        QryRegra.Open;
        bmRegra.Execute;
        TabRegra.Close;
        TabRegra.EmptyTable;
        TabRegra.Open;
     end;
     if not TabRegra.Active then
        TabRegra.Open;

     while not QrySelTipo.Eof do begin
           if not TabRegra.Locate('IDREGRA',QrySelTipo.FieldbyName('IDREGRA').AsString,[]) then begin
              TabRegra.Append;
              TabRegra.FieldByName('IDREGRA').AsString := QrySelTipo.FieldbyName('IDREGRA').AsString;
              TabRegra.FieldByName('NOMEREGRA').AsString := QrySelTipo.FieldbyName('NOMEREGRA').AsString;
              TabRegra.FieldByName('IDTIPOREGRA').AsString := QrySelTipo.FieldbyName('IDTIPOREGRA').AsString;
              TabRegra.FieldByName('DESCRICAOREGRA').AsString := QrySelTipo.FieldbyName('DESCRICAOREGRA').AsString;
              TabRegra.FieldByName('PUBLICADA').AsString  := QrySelTipo.FieldbyName('PUBLICADA').AsString;
              TabRegra.FieldByName('DESCREGRA').AsString  := QrySelTipo.FieldbyName('DESCREGRA').AsString;
              TabRegra.FieldByName('OLDIDREGRA').AsString := QrySelTipo.FieldbyName('OLDIDREGRA').AsString;
              TabRegra.Post;
           end;
           QrySelTipo.Next;
     end;
     frmAguarde.Apaga;
  end;

end;

procedure TfrmExportarRegras.btnRemoverClick(Sender: TObject);
begin
  inherited;
  if not TabRegra.IsEmpty then
     TabRegra.Delete;
end;

procedure TfrmExportarRegras.FormCreate(Sender: TObject);
begin
  inherited;
  //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
  //if fileexists('c:\temp\regra.db') then  DeleteFile('c:\temp\regra.db');
    if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\regra.db') then

  //DeleteFile('c:\temp\regra.db');
    DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\regra.db');

  //if fileexists('c:\temp\regra.mb') then  DeleteFile('c:\temp\regra.mb');
    if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\regra.mb') then

  //DeleteFile('c:\temp\regra.mb');
    DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\regra.mb');

  //if fileexists('c:\temp\algregra.db') then  DeleteFile('c:\temp\algregra.db');
    if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\algregra.db') then

  //DeleteFile('c:\temp\algregra.db');
    DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\algregra.db');

  //if fileexists('c:\temp\cmpbd.db') then  DeleteFile('c:\temp\cmpbd.db');
    if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\cmpbd.db') then

    //DeleteFile('c:\temp\cmpbd.db');
      DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\cmpbd.db');

  //if fileexists('c:\temp\cmpbdgrp.db') then  DeleteFile('c:\temp\cmpbdgrp.db');
    if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\cmpbdgrp.db') then

    //DeleteFile('c:\temp\cmpbdgrp.db');
      DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\cmpbdgrp.db');

  //if fileexists('c:\temp\formula.db') then  DeleteFile('c:\temp\formula.db');
    if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\formula.db') then

    //DeleteFile('c:\temp\formula.db');
      DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\formula.db');

  //if fileexists('c:\temp\grparquivo.db') then  DeleteFile('c:\temp\grparquivo.db');
    if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\grparquivo.db') then

    //DeleteFile('c:\temp\grparquivo.db');
      DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\grparquivo.db');

  //if fileexists('c:\temp\grpformula.db') then  DeleteFile('c:\temp\grpformula.db');
    if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\grpformula.db') then

    //DeleteFile('c:\temp\grpformula.db');
      DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\grpformula.db');

  //if fileexists('c:\temp\tiporegra.db') then  DeleteFile('c:\temp\tiporegra.db');
    if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\tiporegra.mb') then

    //DeleteFile('c:\temp\tiporegra.mb');
      DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\tiporegra.mb');
     //SOL 117091 - Thiago Passos Silva
   TabRegra.DatabaseName:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
   tabFormula.DatabaseName:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
   TabCmpBd.DatabaseName:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
   TabCmpBdGrp.DatabaseName:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
   TabGrpArquivo.DatabaseName:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
   TAbAlgRegra.DatabaseName:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
   TabTipoRegra.DatabaseName:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
   TabGrpFormula.DatabaseName:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
   TAbTodas.DatabaseName:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
   //FIM
end;

procedure TfrmExportarRegras.bbtnConfirmarClick(Sender: TObject);
var
   i, vMax, Reg : LongInt;
   vAux : String;
begin
     if TabRegra.IsEmpty then begin
        MsgDlg('Não existe regra para ser exportada.','Erro',mtConfirmation,[mbOk,mbHelp],0);
        Exit;
     end;
     if MsgDlg('Confirma Exportação dos Dados ?','Erro',mtConfirmation,[mbYes,mbNo],0) = mrNo then
        Exit;

     frmAguarde.Mostra('Reorganizando formulas ...');
     frmAguarde.Refresh;
     QryPlique.Close;
     QryPlique.Open;
     frmAguarde.Pos := 0;
     frmAguarde.Max := QryPlique.RecordCount;
     while not QryPlique.EOF do begin
           vAux := QryPlique.FieldbyName('EXPRESSAOREAL').AsString;
           repeat
                 i := Pos('''',vAux);
                 if i > 0 then
                    vAux := Copy(vAux,1,i-1)+Copy(vAux,i+1,Length(vAux));
           until i = 0;
           QryPlique.Edit;
           QryPlique.FieldbyName('EXPRESSAOREAL').AsString := vAux;
           QryPlique.FieldbyName('EXPRESSAOFORMULA').AsString := vAux;
           QryPlique.Post;
           QryPlique.ApplyUpDates;
           frmAguarde.Pos := frmAguarde.Pos + 1;
           QryPlique.Next;
     end;

     TabRegra.DisableControls;
     frmAguarde.Mostra('Apagando Arquivos de Saida');
     frmAguarde.Refresh;

     //Jéssica Lana SOL 109421 KINTANA 496332
     //if fileexists('c:\temp\algregra.db') then  DeleteFile('c:\temp\algregra.db');
       if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\algregra.db') then

       //DeleteFile('c:\temp\algregra.db');
         DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\algregra.db');

     //if fileexists('c:\temp\cmpbd.db') then  DeleteFile('c:\temp\cmpbd.db');
       if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\cmpbd.db') then

       //DeleteFile('c:\temp\cmpbd.db');
         DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\cmpbd.db');

     //if fileexists('c:\temp\cmpbdgrp.db') then  DeleteFile('c:\temp\cmpbdgrp.db');
       if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\cmpbdgrp.db') then

       //DeleteFile('c:\temp\cmpbdgrp.db');
         DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\cmpbdgrp.db');

     //if fileexists('c:\temp\formula.db') then  DeleteFile('c:\temp\formula.db');
       if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\formula.db') then

       //DeleteFile('c:\temp\formula.db');
         DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\formula.db');

     //if fileexists('c:\temp\grparquivo.db') then  DeleteFile('c:\temp\grparquivo.db');
       if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\grparquivo.db') then

       //DeleteFile('c:\temp\grparquivo.db');
         DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\grparquivo.db');

     //if fileexists('c:\temp\grpformula.db') then  DeleteFile('c:\temp\grpformula.db');
       if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\grpformula.db') then

       //DeleteFile('c:\temp\grpformula.db');
         DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\grpformula.db');

     //if fileexists('c:\temp\tiporegra.db') then  DeleteFile('c:\temp\tiporegra.db');
       if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\tiporegra.db') then

       //DeleteFile('c:\temp\tiporegra.db');
         DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\tiporegra.db');

     //if fileexists('c:\temp\tiporegra.mb') then  DeleteFile('c:\temp\tiporegra.mb');
       if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\tiporegra.mb') then

       //DeleteFile('c:\temp\tiporegra.mb');
         DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\tiporegra.mb');

     frmAguarde.Mostra('Verificando Tabelas do Destino ...');
     frmAguarde.Refresh;
     tabFormula.Close;
     tabCmpBd.Close;
     TabCmpBdGrp.Close;
     TabGrpArquivo.Close;
     TabAlgregra.Close;
     TabTipoRegra.Close;
     TabGrpFormula.Close;
     frmAguarde.Mostra('Exportando Dados ...');
     frmAguarde.Refresh;
     frmAguarde.Pos := 0;
     frmAguarde.Min := 0;
     frmAguarde.Max := 14;
     TabRegra.First;
     Reg := 0;
     frmAguarde.Pos := Reg;
     while not TabRegra.Eof do begin
           with QryAlgRegra do begin
                Close;
                ParambyName('ID').AsInteger := TabRegra.FieldbyName('IDREGRA').AsInteger;
                Open;
           end;
           if Reg = 0 then begin
              bm5.Mode := batCopy;
           end else begin
               bm5.Mode := batAppend;
           end;
           tabAlgregra.Close;
           bm5.Execute;
           Reg := 1;
           frmAguarde.Pos := Reg;
           TabRegra.Next;
     end;

     {-----------------------------------------}
     { Executa as Transferencias DB -> Paradox }
     AbrirQuerysMontadas;
     bm1.Execute;
     Inc(Reg);
     frmAguarde.Pos := Reg;
     TabCmpBd.Close;
     bm2.Execute;
     Inc(Reg);
     frmAguarde.Pos := Reg;
     TabCmpBdGrp.Close;
     bm3.Execute;
     Inc(Reg);
     frmAguarde.Pos := Reg;
     TabGrpArquivo.Close;
     bm4.Execute;
     Inc(Reg);
     frmAguarde.Pos := Reg;
     tabTipoRegra.Close;
     bm6.Execute;
     Inc(Reg);
     frmAguarde.Pos := Reg;
     tabGrpFormula.Close;
     bm7.Execute;
     Inc(Reg);
     frmAguarde.Pos := Reg;
     {-----------------------------------------}

     TabRegra.EnableControls;
     if not TabFormula.Active then
        TabFormula.Open;
     if not TabAlgRegra.Active then
        TabAlgRegra.Open;
     frmAguarde.Mostra('Atualizando dados de formulas ...');
     frmAguarde.Refresh;
     frmAguarde.Pos := 0;
     frmAguarde.Max := TabFormula.RecordCount;
     vMax := 9999999;
     TabFormula.First;
     while not TabFormula.Eof do begin
           TabFormula.Edit;
           TabFormula.FieldbyName('IDFORMULA').AsInteger := vMax;
           TabFormula.Post;

           while TabAlgRegra.Locate('FORMULA1;IDCAMPO2',varArrayOf([ TabFormula.FieldbyName('IDANTIGO').AsInteger,
                                                                     TabFormula.FieldbyName('IDANTIGO').AsString]),[]) do begin
                 TabAlgRegra.Edit;
                 TabAlgRegra.FieldbyName('FORMULA1').AsInteger := vMax;
                 TabAlgRegra.FieldbyName('IDCAMPO2').AsString := InttoStr(vMax);
                 TabAlgRegra.Post;
           end;
           vMax := vMax - 1;
           frmAguarde.Pos := frmAguarde.Pos + 1;
           TabFormula.Next;
     end;
     TabFormula.Close;
     TabAlgRegra.Close;

     if not TabTipoRegra.Active then
        TabTipoRegra.Open;
     if not TabRegra.Active then
        TabRegra.Open;

     {-----------------------------------------}
     frmAguarde.Mostra('Atualizando Tipos de regras ...');
     frmAguarde.Refresh;
     frmAguarde.Pos := 0;
     frmAguarde.Max := TabTipoRegra.RecordCount;

     vMax := 9999999;
     TabTipoRegra.First;
     while not TabTipoRegra.Eof do begin
           TabTipoRegra.Edit;
           TabTipoRegra.FieldbyName('IDTIPOREGRA').AsInteger := vMax;
           TabTipoRegra.Post;
           while TabRegra.Locate('IDTIPOREGRA', TabTipoRegra.FieldbyName('IDANTIGO').AsInteger,[]) do begin
                 TabRegra.Edit;
                 TabRegra.FieldByName('IDTIPOREGRA').AsInteger := vMax;
                 TabRegra.Post;
           end;
           vMax := vMax - 1;
           frmAguarde.Pos := frmAguarde.Pos + 1;
           TabTipoRegra.Next;
     end;

     TabTipoRegra.Close;
     {-----------------------------------------}

     TabRegra.Close;
     tabAlgregra.Open;
     tabFormula.Open;
     TabAlgRegra.First;
     While not TabAlgRegra.Eof do begin
           if (TabAlgRegra.FieldbyName('FORMULA1').AsInteger > 0) and
              (TabAlgRegra.FieldbyName('TIPOCAMPO2').AsInteger = 4) then begin
              if TabFormula.Locate('IDANTIGO',TabAlgRegra.FieldbyName('FORMULA1').AsInteger,[]) then begin
                 TabAlgRegra.Edit;
                 TabAlgRegra.FieldbyName('FORMULA1').AsInteger := TabFormula.FieldbyName('IDFORMULA').AsInteger;
                 TabAlgRegra.FieldbyName('IDCAMPO2').AsString := TabFormula.FieldbyName('IDFORMULA').AsString;
                 TabAlgRegra.Post;
              end;
           end;
           TabAlgRegra.Next;
     end;

     tabAlgregra.Close;
     tabFormula.Close;


     frmAguarde.Mostra('Compactando Arquivos ...');
     btnCompactar.Click;
     frmAguarde.Mostra('Apagando Arquivos ...');
     BtnApagarTudo.Click;

     { Grava Log da operação}
     If Not Sistema.GravaLogOperacoes('Importação de Tabelas Longas') Then
        Raise Exception.Create('Não Consegui Gravar o Log');

     frmAguarde.Apaga;
end;

procedure TfrmExportarRegras.AbrirQuerysMontadas;
var
   vSql : String;
   i : LongInt;
begin
     TabRegra.DisableControls;
     with QryFormula do begin
          Close;
          Sql.Clear;
          vSql := '';
          TabRegra.First;
          while not TabRegra.Eof do begin
                vSql := vSql + ' (IDREGRA = '+TabRegra.FieldbyName('IDREGRA').AsString+') OR ';
                TabRegra.Next;
          end;
          if not TabRegra.IsEmpty then begin
             vSql := Copy(vSql,1,Length(vSql)-4);
             vSql := 'WHERE (TIPOCAMPO2 = 4) AND ('+vSql+')';
          end else
              vSql := '';
          vSql := 'SELECT F.IDFORMULA, F.CODGRUPOFORMULA, F.EXPRESSAOFORMULA, F.DESCRICAOFORMULA, '+
                  'F.EXPRESSAOREAL, 0 AS TIPO, F.IDFORMULA AS IDANTIGO FROM '+
                  '(SELECT FORMULA1, TIPOCAMPO2 FROM ALGREGRA '+vSql+
                  ') A, FORMULA F WHERE (A.FORMULA1 IS NOT NULL) AND (A.FORMULA1=F.IDFORMULA) AND '+
                  '(A. TIPOCAMPO2 = 4) GROUP BY F.IDFORMULA, F.DESCRICAOFORMULA, F.EXPRESSAOREAL, '+
                  'F.CODGRUPOFORMULA, F.EXPRESSAOFORMULA';
          Sql.Add(vSql);
          Open;
     end;
     frmAguarde.Pos := frmAguarde.Pos + 1;

     with QryGrpFormula do begin
          Close;
          Close;
          Sql.Clear;
          vSql := 'SELECT GRP.CODGRUPOFORMULA, GRP.DESCGRUPOFORMULA FROM GRPFORMULA GRP, '+
                  '('+QryFormula.Text+') F WHERE GRP.CODGRUPOFORMULA = F.CODGRUPOFORMULA '+
                  'GROUP BY GRP.CODGRUPOFORMULA, GRP.DESCGRUPOFORMULA ORDER BY GRP.CODGRUPOFORMULA';
          Sql.Add(vSql);
          Open;
     end;
     frmAguarde.Pos := frmAguarde.Pos + 1;

     if not TabAlgRegra.Active then
        TabAlgRegra.Open;
     LstAux.Items.Clear;
     while not TabAlgRegra.Eof do begin
           if (TabAlgRegra.FieldbyName('idcampo').AsString <> '') then
              InsereLista(TabAlgRegra.FieldbyName('idcampo').AsString);
           if (TabAlgRegra.FieldbyName('idcampo2').AsString <> '') then
              InsereLista(TabAlgRegra.FieldbyName('idcampo2').AsString);
           TabAlgRegra.Next;
     end;
     TabAlgRegra.Close;

     with QryCmpBd do begin
          Close;
          Sql.Clear;
          vSql := '';
          for i := 0 to LstAux.Items.Count - 1 do
              vSql := vSql + '(IDCAMPO = '''+LstAux.Items[i]+''') OR ';
          if LstAux.Items.Count > 0 then begin
             vSql := Copy(vSql,1,Length(vSql)-4);
             vSql := 'WHERE ('+vSql+')';
          end else
              vSql := '';
          vSql := 'SELECT IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, '+
                  'CAMPODOBANCO, CHAVE, FLGOBRIGATORIO, APELIDO, IDTIPODADO '+
                  'FROM CMPBD '+vSql;
          Sql.Add(vSql);
          Open;
     end;
     frmAguarde.Pos := frmAguarde.Pos + 1;


     with QryCmpBdGrp do begin
          Close;
          Sql.Clear;
          vSql := 'SELECT G.CODGRUPOARQUIVO, G.IDCAMPO FROM CMPBDGRP G, ( '+
                  QryCmpBd.Text+') C WHERE C.IDCAMPO = G.IDCAMPO';
          Sql.Add(vSql);
          Open;
     end;
     frmAguarde.Pos := frmAguarde.Pos + 1;


     with QryGrpArquivo do begin
          Close;
          Sql.Clear;
          vSql := 'SELECT G.CODGRUPOARQUIVO, G.DESCGRUPOARQUIVO, G.SETORGRUPOS '+
                  'FROM GRPARQUIVO G, ('+QryCmpBdGrp.Text+') GRP WHERE '+
                  'GRP.CODGRUPOARQUIVO = G.CODGRUPOARQUIVO GROUP BY G.CODGRUPOARQUIVO, '+
                  'G.DESCGRUPOARQUIVO, G.SETORGRUPOS';
          Sql.Add(vSql);
          Open;
     end;
     frmAguarde.Pos := frmAguarde.Pos + 1;


     with QryTipoRegra do begin
          Close;
          Sql.Clear;
          vSql := '';
          TabRegra.First;
          while not TabRegra.Eof do begin
                vSql := vSql + ' IDREGRA = '+TabRegra.FieldbyName('IDREGRA').AsString+' OR ';
                TabRegra.Next;
          end;
          if not TabRegra.IsEmpty then begin
             vSql := Copy(vSql,1,Length(vSql)-4);
             vSql := 'WHERE ('+vSql+')';
          end else
              vSql := '';
          vSql := 'SELECT T.IDTIPOREGRA, T.DESCREGRA, T.SQLREGRA, T.IDGRUPOREGRA, '+
                  'G.DESCRICAO, T.IDTIPOREGRA AS IDANTIGO FROM '+
                  '(SELECT IDTIPOREGRA FROM REGRA '+vSql+' GROUP BY IDTIPOREGRA) R, '+
                  'TIPOREGRA T , GRUPOREGRA G '+
                  'WHERE (T.IDTIPOREGRA = R.IDTIPOREGRA) AND (T.IDGRUPOREGRA = G.IDGRUPOREGRA) '+
                  'ORDER BY IDTIPOREGRA';
          Sql.Add(vSql);
          Open;
     end;
     frmAguarde.Pos := frmAguarde.Pos + 1;
     TabRegra.EnableControls;
end;


procedure TfrmExportarRegras.btnVerificarClick(Sender: TObject);
var
   vTot1, vTot2 : LongInt;
begin
  inherited;
  TabRegra.DisableControls;

  QryRegraParadox.Close;
  QryRegraParadox.DatabaseName := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);  // SOL:126014 - Daniel Begnami


  QryRegraParadox.Open;

  with QryPai do begin
       Close;
       Prepare;
  end;

  with QryFilha do begin
       Close;
       Prepare;
  end;

  with QryForm do begin
       Close;
       Prepare;
  end;

  { Não marcando as Regras a quantidade até não existir mais nenhum tipo de }
  { registro filho.                                                         }
  If Not chklstOpcoes.Selected[3] then begin
     vTot1 := 1;
     vTot2 := 2;
     while vTot1 <> vTot2 do begin
           vTot1 := TabRegra.RecordCount;
           if chklstOpcoes.Selected[0] then begin
              frmAguarde.Mostra('Selecionando Regras Pai');
              frmAguarde.Refresh;
              SelecionaPai;
              frmAguarde.Apaga;
           end;
           if chklstOpcoes.Selected[1] then begin
              frmAguarde.Mostra('Selecionando Regras Filhas');
              frmAguarde.Refresh;
              SelecionaFilha;
              frmAguarde.Apaga;
           end;
           if chklstOpcoes.Selected[2] then begin
              frmAguarde.Mostra('Selecionando Regras Filhas Formulas');
              frmAguarde.Refresh;
              SelecionaForm;
              frmAguarde.Apaga;
           end;
           QryRegraParadox.Close;
           QryRegraParadox.Open;
           vTot2 := TabRegra.RecordCount;

     end;
     TabRegra.EnableControls;
     Exit;
  end;

  if chklstOpcoes.Selected[0] then begin
     frmAguarde.Mostra('Selecionando Regras Pai');
     frmAguarde.Refresh;
     SelecionaPai;
     frmAguarde.Apaga;
  end;
  if chklstOpcoes.Selected[1] then begin
     frmAguarde.Mostra('Selecionando Regras Filhas');
     frmAguarde.Refresh;
     SelecionaFilha;
     frmAguarde.Apaga;
  end;
  if chklstOpcoes.Selected[2] then begin
     frmAguarde.Mostra('Selecionando Regras Filhas Formulas');
     frmAguarde.Refresh;
     SelecionaForm;
     frmAguarde.Apaga;
  end;
  TabRegra.EnableControls;
end;


procedure TfrmExportarRegras.SelecionaPai;
begin
     QryRegraParadox.first;
     while not QryRegraParadox.Eof do begin
           with QryPai do begin
                Close;
                ParambyName('ID').AsString := QryRegraParadox.FieldbyName('IDREGRA').AsString;
                Open;
           end;

           QryPai.First;
           while not QryPai.Eof do begin
                 with QryRegra do begin
                      Close;
                      ParamByName('ID').AsInteger := StrtoInt(QryPai.FieldbyName('IDREGRA').AsString);
                      Open;
                 end;
                 if not TabRegra.Locate('IDREGRA',QryRegra.FieldbyName('IDREGRA').AsString,[]) then begin
                    TabRegra.Append;
                    TabRegra.FieldByName('IDREGRA').AsString := QryRegra.FieldbyName('IDREGRA').AsString;
                    TabRegra.FieldByName('NOMEREGRA').AsString := QryRegra.FieldbyName('NOMEREGRA').AsString;
                    TabRegra.FieldByName('IDTIPOREGRA').AsString := QryRegra.FieldbyName('IDTIPOREGRA').AsString;
                    TabRegra.FieldByName('DESCRICAOREGRA').AsString := QryRegra.FieldbyName('DESCRICAOREGRA').AsString;
                    TabRegra.FieldByName('PUBLICADA').AsString := QryRegra.FieldbyName('PUBLICADA').AsString;
                    TabRegra.FieldByName('OLDIDREGRA').AsString := QryRegra.FieldbyName('OLDIDREGRA').AsString;
                    try
                       TabRegra.Post;
                    except
                          TabRegra.Cancel;
                    end;
                 end;
                 QryPai.Next;
           end;


           if not QryPai.IsEmpty then begin
              if not TabRegra.Locate('IDREGRA',QryPai.FieldbyName('IDREGRA').AsString,[]) then begin
                 TabRegra.Append;
                 TabRegra.FieldByName('IDREGRA').AsString := QryPai.FieldByName('IDREGRA').AsString;
                 TabRegra.FieldByName('NOMEREGRA').AsString := QryPai.FieldByName('NOMEREGRA').AsString;
                 TabRegra.FieldByName('IDTIPOREGRA').AsString := QryPai.FieldByName('IDTIPOREGRA').AsString;
                 TabRegra.FieldByName('DESCRICAOREGRA').AsString := QryPai.FieldByName('DESCRICAOREGRA').AsString;
                 TabRegra.FieldByName('PUBLICADA').AsString := QryPai.FieldByName('PUBLICADA').AsString;
                 TabRegra.FieldByName('OLDIDREGRA').AsString := QryPai.FieldByName('OLDIDREGRA').AsString;
                 try
                    TabRegra.Post;
                 except
                       TabRegra.Cancel;
                 end;
              end;
           end;
           QryRegraParadox.Next;
     end;

end;


procedure TfrmExportarRegras.SelecionaFilha;
begin
     QryRegraParadox.first;
     while not QryRegraParadox.Eof do begin
           with QryFilha do begin
                Close;
                ParambyName('ID').AsInteger := QryRegraParadox.FieldbyName('IDREGRA').AsInteger;
                Open;
           end;
           if not QryFilha.IsEmpty then begin
              QryFilha.First;
              while not QryFilha.Eof do begin
                    if not TabRegra.Locate('IDREGRA',QryFilha.FieldbyName('IDREGRA').AsString,[]) then begin
                      TabRegra.Append;
                       TabRegra.FieldByName('IDREGRA').AsString        := QryFilha.FieldByName('IDREGRA').AsString;
                       TabRegra.FieldByName('NOMEREGRA').AsString      := QryFilha.FieldByName('NOMEREGRA').AsString;
                       TabRegra.FieldByName('IDTIPOREGRA').AsString    := QryFilha.FieldByName('IDTIPOREGRA').AsString;
                       TabRegra.FieldByName('DESCRICAOREGRA').AsString := QryFilha.FieldByName('DESCRICAOREGRA').AsString;
                       TabRegra.FieldByName('PUBLICADA').AsString      := QryFilha.FieldByName('PUBLICADA').AsString;
                       TabRegra.FieldByName('OLDIDREGRA').AsString     := QryFilha.FieldByName('OLDIDREGRA').AsString;
                      TabRegra.Post;
                    end;
                    QryFilha.Next;
              end;
           end;
           QryRegraParadox.Next;
     end;
end;

procedure TfrmExportarRegras.SelecionaForm;
begin
     QryRegraParadox.first;
     while not QryRegraParadox.Eof do begin
           with QryForm do begin
                Close;
                ParambyName('ID').AsInteger := QryRegraParadox.FieldbyName('IDREGRA').AsInteger;
                Open;
           end;
           if not QryForm.IsEmpty then begin
              if not TabRegra.Locate('IDREGRA',QryForm.FieldbyName('IDREGRA').AsString,[]) then begin
                 TabRegra.Append;
                 TabRegra.FieldByName('IDREGRA').AsString        := QryForm.FieldByName('IDREGRA').AsString;
                 TabRegra.FieldByName('NOMEREGRA').AsString      := QryForm.FieldByName('NOMEREGRA').AsString;
                 TabRegra.FieldByName('IDTIPOREGRA').AsString    := QryForm.FieldByName('IDTIPOREGRA').AsString;
                 TabRegra.FieldByName('DESCRICAOREGRA').AsString := QryForm.FieldByName('DESCRICAOREGRA').AsString;
                 TabRegra.FieldByName('PUBLICADA').AsString      := QryForm.FieldByName('PUBLICADA').AsString;
                 TabRegra.FieldByName('OLDIDREGRA').AsString     := QryForm.FieldByName('OLDIDREGRA').AsString;
                 TabRegra.Post;
              end;
           end;
           QryRegraParadox.Next;
     end;
end;


procedure TfrmExportarRegras.InsereLista(Texto : String);
var
   i, Tamanho : LongInt;
   Resultado : Boolean;
begin
     if Texto = '' then
        Exit;
     try
        StrtoInt(Texto);
     except
           Tamanho := LstAux.Items.Count;
           Resultado := False;
           for i := 0 to Tamanho - 1 do begin
               if LstAux.Items[i] = Texto then begin
                  Resultado := True;
                  Break;
               end;
           end;
           if not Resultado then
              LstAux.Items.Add(Texto);
     end;
end;



procedure TfrmExportarRegras.BtnApagarTudoClick(Sender: TObject);
begin
  inherited;
  TabRegra.Close;
  TabAlgRegra.Close;

  //Jéssica Lana SOL 109421 KINTANA 496332 - 27/02/2009

  //if fileexists('c:\temp\regra.db') then  DeleteFile('c:\temp\regra.db');
    if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\regra.db') then

    //DeleteFile('c:\temp\regra.db');
      DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\regra.db');

  //if fileexists('c:\temp\regra.mb') then  DeleteFile('c:\temp\regra.mb');
    if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\regra.mb') then

    //DeleteFile('c:\temp\regra.mb');
      DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\regra.mb');

  //if fileexists('c:\temp\algregra.db') then  DeleteFile('c:\temp\algregra.db');
    if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\algregra.db') then

    //DeleteFile('c:\temp\algregra.db');
      DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\algregra.db');

  //if fileexists('c:\temp\cmpbd.db') then  DeleteFile('c:\temp\cmpbd.db');
    if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\cmpbd.db') then

    //DeleteFile('c:\temp\cmpbd.db');
      DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\cmpbd.db');

  //if fileexists('c:\temp\cmpbdgrp.db') then  DeleteFile('c:\temp\cmpbdgrp.db');
    if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\cmpbdgrp.db') then

    //DeleteFile('c:\temp\cmpbdgrp.db');
      DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\cmpbdgrp.db');

  //if fileexists('c:\temp\formula.db') then  DeleteFile('c:\temp\formula.db');
    if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\formula.db') then

    //DeleteFile('c:\temp\formula.db');
      DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\formula.db');

  //if fileexists('c:\temp\grparquivo.db') then  DeleteFile('c:\temp\grparquivo.db');
    if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\grparquivo.db') then

    //DeleteFile('c:\temp\grparquivo.db');
      DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\grparquivo.db');

  //if fileexists('c:\temp\grpformula.db') then  DeleteFile('c:\temp\grpformula.db');
    if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\grpformula.db') then

    //DeleteFile('c:\temp\grpformula.db');
      DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\grpformula.db');

  //if fileexists('c:\temp\tiporegra.db') then  DeleteFile('c:\temp\tiporegra.db');
    if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\tiporegra.db') then

    //DeleteFile('c:\temp\tiporegra.db');
      DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\tiporegra.db');

  //if fileexists('c:\temp\tiporegra.mb') then  DeleteFile('c:\temp\tiporegra.mb');
    if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\tiporegra.mb') then

    //DeleteFile('c:\temp\tiporegra.mb');
      DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\tiporegra.mb');

end;

procedure TfrmExportarRegras.btnCompactarClick(Sender: TObject);
begin
  inherited;
  Ds.Execute;
  TabRegra.Close;
  TabAlgRegra.Close;
  if Ds.FileName <> '' then begin
     if fileexists(Ds.FileName) then
        DeleteFile(Ds.FileName);
     ZipMaster1.zipfilename:=Ds.FileName;
  end else begin
      //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
      //if fileexists('C:\REGRA.EXP') then
      if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\REGRA.EXP') then

         //DeleteFile('C:\REGRA.EXP');
           DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\REGRA.EXP');

      //ZipMaster1.zipfilename:='C:\REGRA.EXP';
        ZipMaster1.zipfilename:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\REGRA.EXP';
  end;

  //ZipMaster1.FSpecArgs.Add('C:\Temp\*.db');
    ZipMaster1.FSpecArgs.Add(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\*.db');
  //ZipMaster1.FSpecArgs.Add('C:\Temp\*.mb');
    ZipMaster1.FSpecArgs.Add(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\*.mb');

  ZipMaster1.AddOptions:=[AddMove];
  ZipMaster1.Add;
end;

procedure TfrmExportarRegras.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmAguarde.Mostra('Apagando Arquivos ...');
  BtnApagarTudo.Click;
  frmAguarde.Apaga;
end;

procedure TfrmExportarRegras.btnTodasClick(Sender: TObject);
begin
  inherited;
  frmAguarde.Mostra('Selecionando todas regra ...');
  frmAguarde.Refresh;
  TabRegra.Close;
  QryTodas.Close;
  QryTodas.Open;
  bm8.Execute;
  TabRegra.Open;
  frmAguarde.Apaga;
end;

procedure TfrmExportarRegras.FormShow(Sender: TObject);
begin
  inherited;
  { Verifica a existencia da pasta C:\TEMP, caso não exista, Cria }

     //Jéssica Lana SOL 109421 KINTANA 496332
    //If Not DirectoryExists('C:\TEMP') Then Begin
    If Not DirectoryExists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)) Then Begin

    //CreateDir('C:\TEMP');
      CreateDir(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa));
    End;
end;

procedure TfrmExportarRegras.TabRegraAfterOpen(DataSet: TDataSet);
begin
  inherited;
  Panel7.Caption := '  Regras Selecionadas  '+IntToStr(TabRegra.RecordCount);
end;

procedure TfrmExportarRegras.TabRegraAfterDelete(DataSet: TDataSet);
begin
  inherited;
  Panel7.Caption := '  Regras Selecionadas  '+IntToStr(TabRegra.RecordCount);
end;

procedure TfrmExportarRegras.TabRegraAfterClose(DataSet: TDataSet);
begin
  inherited;
  Panel7.Caption := '  Regras Selecionadas  ';
end;

procedure TfrmExportarRegras.TabRegraAfterPost(DataSet: TDataSet);
begin
  inherited;
  Panel7.Caption := '  Regras Selecionadas  '+IntToStr(TabRegra.RecordCount);
end;

end.


