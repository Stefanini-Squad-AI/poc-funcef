// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  André OLiveira
// Data        :  19/07/2012
// Pendência   :  SOL 169547/8741 KINTANA 1619963
// Descrição   :  alteração da condiçoes de inserção ou alteração das regras
//                importadas
//------------------------------------------------------------------------------
// Autor(a)    :  Thiago Passos Silva
// Data        :  14/05/2009
// Pendência   :  SOL 117091 KINTANA 550761
// Descrição   :  Alteração de gravação de arquivos de log na raiz do disco C:
//------------------------------------------------------------------------------
// Autor(a)    :  Jéssica Lana
// Data        :  27/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descrição   :  Alteração de gravação de arquivos de log na raiz do disco C:
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Data       : 06/02/2006
//  Pendência  : 21362
//  Descrição  : Permitir importar Regras com indentificadores publicados mas com
//               outro Nome
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Data       : 02/05/2005
//  Pendência  : 14986
//  Descrição  : Erro ao importar formulas publicadas
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : diversas
//  Data       : 08/04/2004
//  Pendência  : 15043
//  Descrição  : Alterado a rotina de importação de formulas para considerar por
//               DESCRICAOFORMULA, EXPRESSAOREAL e CODGRUPOFORMULA.
//------------------------------------------------------------------------------
unit fImportarRegras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Grids, Wwdbigrd, Wwdbgrid, DBTables,
  Wwquery, Db, Wwtable, Wwdatsrc, Mask, wwdbedit, BfDialogs, BrowseFolder,
  uProcuraDir, FileCtrl, ZipMstr, DBGrids, uSistema;

type
  tOperacao = (toInsert, toAlteracao);


  TfrmImportarRegras = class(TfrmOkCancelar)
    pc: TPageControl;
    tbRegras: TTabSheet;
    tbPassos: TTabSheet;
    tbFormulas: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Panel5: TPanel;
    Splitter3: TSplitter;
    Panel7: TPanel;
    Panel8: TPanel;
    Splitter5: TSplitter;
    Panel9: TPanel;
    Splitter6: TSplitter;
    Panel10: TPanel;
    Panel11: TPanel;
    wwDBGrid1: TwwDBGrid;
    wwDBGrid2: TwwDBGrid;
    Panel12: TPanel;
    Panel13: TPanel;
    wwDBGrid3: TwwDBGrid;
    Panel14: TPanel;
    wwDBGrid4: TwwDBGrid;
    dbgrFormulaExp: TwwDBGrid;
    Panel15: TPanel;
    wwDBGrid6: TwwDBGrid;
    Panel16: TPanel;
    dsTabRegra: TwwDataSource;
    TabRegra: TwwTable;
    QryRegraView: TwwQuery;
    dsRegraView: TwwDataSource;
    dedRegraExp: TwwDBEdit;
    Pdd: TProcuraDirDlg;
    TabTipoRegra: TwwTable;
    TabAlgRegra: TwwTable;
    QryPassosPdx: TwwQuery;
    dsPassosPdx: TwwDataSource;
    dedRegra: TwwDBEdit;
    QryAlgregra: TwwQuery;
    QryAlgregraIDALGORITMODAREG: TFloatField;
    QryAlgregraDESCRICAOALGORIT: TStringField;
    QryAlgregraIDREGRA: TFloatField;
    QryAlgregraIDCAMPO: TStringField;
    QryAlgregraCORRELACAO: TStringField;
    QryAlgregraFORMULA2: TFloatField;
    QryAlgregraIDCAMPO2: TStringField;
    QryAlgregraVALOR: TStringField;
    QryAlgregraTIPOALGORITMO: TFloatField;
    QryAlgregraALGORSUBSEQTRUE: TFloatField;
    QryAlgregraFORMULA1: TFloatField;
    QryAlgregraALGORSUBSEQFALSE: TFloatField;
    QryAlgregraTIPOCAMPO1: TFloatField;
    QryAlgregraTIPOCAMPO2: TFloatField;
    QryAlgregraFORMATACAO: TFloatField;
    dsAlgregra: TwwDataSource;
    QryFormulaPdx: TwwQuery;
    dsFormulaPdx: TwwDataSource;
    QryFormulaAux: TwwQuery;
    dsFormulaAux: TwwDataSource;
    QryFormula: TwwQuery;
    dsFormula: TwwDataSource;
    dedFormula: TwwDBEdit;
    Mens: TStaticText;
    tbOutras: TTabSheet;
    PanOutras: TPanel;
    wwDBGrid5: TwwDBGrid;
    tabGrpFormula: TwwTable;
    TabGrpArquivo: TwwTable;
    TabCmpBdGrp: TwwTable;
    TabCmpBd: TwwTable;
    tabFormula: TwwTable;
    QryWrk: TwwQuery;
    tbResultados: TTabSheet;
    rchedt: TRichEdit;
    Od: TOpenDialog;
    ZipMaster1: TZipMaster;
    btnDescompactar: TButton;
    Panel1: TPanel;
    SbtnSalvar: TSpeedButton;
    Sd: TSaveDialog;
    QryTipoRegra: TwwQuery;
    QryFormulaBD: TwwQuery;
    QryRegraBD: TwwQuery;
    btnNovoRegra: TBitBtn;
    btnExcluirRegra: TBitBtn;
    btnNovaFormula: TBitBtn;
    btnExcluirFormula: TBitBtn;
    BtExcPassos: TBitBtn;
    CkBxExcluiPassos: TCheckBox;
    DataSource1: TDataSource;
    Table1: TTable;
    QryAux: TwwQuery;
    btnDiretorio: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure dedRegraExpChange(Sender: TObject);
    procedure btnDiretorioClick(Sender: TObject);
    procedure dedRegraChange(Sender: TObject);
    procedure dedFormulaChange(Sender: TObject);
    procedure btnNovoRegraClick(Sender: TObject);
    procedure btnExcluirRegraClick(Sender: TObject);
    procedure btnNovaFormulaClick(Sender: TObject);
    procedure btnExcluirFormulaClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnDescompactarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure TrataTabelas;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SbtnSalvarClick(Sender: TObject);
    procedure BtExcPassosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    Function RegraPublicada  (IdRegra : String): Boolean;
    Function FormulaPublicada(IdFormula : String): Boolean;
    procedure ImportaRegrasNomes (IDRegra, IDRegraOLD, sRegraOper : String);
    procedure Split (const Delimiter: Char;  Input: string; const Strings: TStringList) ;
  public
    { Public declarations }
  end;

var
  frmImportarRegras: TfrmImportarRegras;
  vDiretorio : String;
  Executando : Boolean;

implementation

uses uMensErro, fAguarde, uDatabase, dRelDetalhes;

{$R *.DFM}

procedure TfrmImportarRegras.FormCreate(Sender: TObject);
begin
  inherited;

        //Jéssica Lana SOL 109421 KINTANA 496332
        ZipMaster1.ExtrBaseDir:=Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

  pc.ActivePage := tbRegras;

  //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
  //if fileexists('c:\temp\regra.db') then  DeleteFile('c:\temp\regra.db');
  if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\regra.db') then
   DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\regra.db');

  //if fileexists('c:\temp\regra.mb') then  DeleteFile('c:\temp\regra.mb');
  if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\regra.mb') then
   DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\regra.mb');

  //if fileexists('c:\temp\algregra.db') then  DeleteFile('c:\temp\algregra.db');
  if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\algregra.db') then
   DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\algregra.db');

  //if fileexists('c:\temp\cmpbd.db') then  DeleteFile('c:\temp\cmpbd.db');
  if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\cmpbd.db') then
   DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\cmpbd.db');

  //if fileexists('c:\temp\cmpbdgrp.db') then  DeleteFile('c:\temp\cmpbdgrp.db');
  if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\cmpbdgrp.db') then
   DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\cmpbdgrp.db');

  //if fileexists('c:\temp\formula.db') then  DeleteFile('c:\temp\formula.db');
  if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\formula.db') then
   DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\formula.db');

  //if fileexists('c:\temp\grparquivo.db') then  DeleteFile('c:\temp\grparquivo.db');
  if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\grparquivo.db') then
   DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\grparquivo.db');

  //if fileexists('c:\temp\grpformula.db') then  DeleteFile('c:\temp\grpformula.db');
  if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\grpformula.db') then
   DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\grpformula.db');

  //if fileexists('c:\temp\tiporegra.db') then  DeleteFile('c:\temp\tiporegra.db');
  if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\tiporegra.db') then
   DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\tiporegra.db');

  //if fileexists('c:\temp\tiporegra.mb') then  DeleteFile('c:\temp\tiporegra.mb');
  if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\tiporegra.mb') then
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
   QryFormulaPdx.DatabaseName:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
   QryPassosPdx.DatabaseName:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
   //FIM
end;

procedure TfrmImportarRegras.dedRegraExpChange(Sender: TObject);
begin
  inherited;

  If Executando Then
    Exit;

  If (TabRegra.Active) And (TabRegra.RecordCount <> 0) and (TabTipoRegra.Active)  then begin
     if TabTipoRegra.Locate('IDTIPOREGRA',TabRegra.FieldbyName('IDTIPOREGRA').AsString,[]) then begin
       { Busca Regras com o nesmo Nome das que serão importadas }
        with QryRegraView do begin
             Close;
             ParamByName('NOME').AsString := Trim(TabRegra.FieldbyName('NOMEREGRA').AsString);
             ParamByName('TIPO').AsString := Trim(TabTipoRegra.FieldbyName('DESCREGRA').AsString);
             Open;
        end;

        with QryPassosPdx do begin
             Close;
             ParambyName('ID').AsInteger := TabRegra.FieldbyName('IDREGRA').AsInteger;
             Open;
        end;

        with QryFormulaPdx do begin
             Close;
             ParambyName('ID').AsInteger := TabRegra.FieldbyName('IDREGRA').AsInteger;
             Open;
        end;

        
        with QryFormula  do begin
             Close;
             ParambyName('DESCRICAOFORMULA').AsString :=  Trim(QryFormulaPdx.FieldbyName('DESCRICAOFORMULA').AsString);
             ParambyName('EXPRESSAOREAL').AsString    :=  Trim(QryFormulaPdx.FieldbyName('EXPRESSAOREAL').AsString);
             ParambyName('CODGRUPOFORMULA').AsString  :=  Trim(QryFormulaPdx.FieldbyName('CODGRUPOFORMULA').AsString);
             Open;
        end;
        

     end else
         QryRegraView.Close;
  end;

end;

{******************************************************************************}
{ Busca Arquivo a Importar                                                     }
procedure TfrmImportarRegras.btnDiretorioClick(Sender: TObject);
begin
  inherited;
  { Executa Rotina de Descompactação }
  btnDescompactar.Click;

  frmAguarde.Mostra('Selecionando Dados ...');
  frmAguarde.Refresh;
  TabRegra.Close;

  //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
  //If (fileexists('C:\TEMP\ALGREGRA.DB'))   and (fileexists('C:\TEMP\CMPBD.DB'))      and
  If (fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\ALGREGRA.DB')) and (fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CMPBD.DB'))      and

  //(fileexists('C:\TEMP\CMPBDGRP.DB'))   and (fileexists('C:\TEMP\CMPBD.DB'))
  (fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CMPBDGRP.DB'))    and (fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CMPBD.DB'))      and

  //(fileexists('C:\TEMP\CMPBDGRP.DB'))   and (fileexists('C:\TEMP\FORMULA.DB'))    and
  (fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CMPBDGRP.DB'))    and (fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\FORMULA.DB'))    and

  //(fileexists('C:\TEMP\GRPARQUIVO.DB')) and (fileexists('C:\TEMP\GRPFORMULA.DB')) and
  (fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\GRPARQUIVO.DB'))  and (fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\GRPFORMULA.DB')) and

  //(fileexists('C:\TEMP\REGRA.DB'))      and (fileexists('C:\TEMP\REGRA.MB'))      and
  (fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\REGRA.DB'))       and (fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\REGRA.MB'))      and

  //(fileexists('C:\TEMP\TIPOREGRA.DB'))  and (fileexists('C:\TEMP\TIPOREGRA.MB'))
  (fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\TIPOREGRA.DB'))   and (fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\TIPOREGRA.MB'))

  then begin

    with QryFormulaPdx do begin
      Close;
      Open;
    end;

    with QryPassosPdx do begin
      Close;
      Open;
    end;

    with QryFormulaPdx do begin
      Close;
      Open;
    end;

    with TabAlgRegra do begin
      Close;
      Open;
    end;

    with TabTipoRegra do begin
      Close;
      Open;
    end;

    with TabRegra do begin
      Close;
      Open;
    end;

    with tabFormula do begin
      Close;
      Open;
    end;

    with TabCmpBd do begin
      Close;
      Open;
    end;

    with TabCmpBdGrp do begin
      Close;
      Open;
    end;

    with TabGrpFormula do begin
      Close;
      Open;
    end;

    with TabGrpArquivo do begin
      Close;
      Open;
    end;

    frmAguarde.Apaga;
  end else begin
    frmAguarde.Apaga;
    MsgDlg('Faltam Arquivos de Exportação.','Erro',mtError,[mbOk,mbHelp],0);
  end;

end;

procedure TfrmImportarRegras.dedRegraChange(Sender: TObject);
begin
  inherited;
  if Executando then
     Exit;
  with QryAlgregra do begin
       Close;
       ParambyName('ID').AsInteger := QryRegraView.FieldbyName('IDREGRA').AsInteger;
       Open;
  end;

end;

procedure TfrmImportarRegras.dedFormulaChange(Sender: TObject);
begin
  inherited;
  if Executando then
     Exit;
  { Busca Formulas com mesmo nome / expressao }
  with QryFormulaAux do begin
    Close;
    ParambyName('DESCR').AsString := Trim(QryFormulaPdx.FieldbyName('DESCRICAOFORMULA').AsString);
    ParambyName('EXPR').AsString  := Trim(QryFormulaPdx.FieldbyName('EXPRESSAOREAL').AsString);
    ParambyName('CODGR').AsString := Trim(QryFormulaPdx.FieldbyName('CODGRUPOFORMULA').AsString); 
    Open;
  end;

  QryFormula.Close; 

  if QryFormulaAux.IsEmpty then begin
     Mens.Caption := '';
     PanOutras.Caption := '';
     btnExcluirFormula.Enabled := False;
  end else begin
      btnExcluirFormula.Enabled := True;
      Mens.Caption := 'Existe(m) '+InttoStr(QryFormulaAux.RecordCount)+' Fórmula(s) como esta.';
      PanOutras.Caption := 'Fórmula Número : '+QryFormulaPdx.FieldbyName('IDFORMULA').AsString+' '+
                           'Descrição : '+QryFormulaPdx.FieldbyName('DESCRICAOFORMULA').AsString;

      
      QryFormula.Close;
      QryFormula.ParambyName('DESCRICAOFORMULA').AsString :=  Trim(QryFormulaPdx.FieldbyName('DESCRICAOFORMULA').AsString);
      QryFormula.ParambyName('EXPRESSAOREAL').AsString    :=  Trim(QryFormulaPdx.FieldbyName('EXPRESSAOREAL').AsString);
      QryFormula.ParambyName('CODGRUPOFORMULA').AsString  :=  Trim(QryFormulaPdx.FieldbyName('CODGRUPOFORMULA').AsString);
      QryFormula.Open;
      

      
  end;
end;

procedure TfrmImportarRegras.btnNovoRegraClick(Sender: TObject);
begin
  inherited;
  frmAguarde.Mostra('Gerando uma nova Regra ...');
  frmAguarde.Refresh;
  if not TabRegra.IsEmpty then begin
     TabRegra.Edit;
     TabRegra.FieldbyName('NOMEREGRA').AsString := TabRegra.FieldbyName('NOMEREGRA').AsString+' (Copia)';
     TabRegra.Post;
  end;
  frmAguarde.Apaga;
end;

procedure TfrmImportarRegras.btnExcluirRegraClick(Sender: TObject);
var
   vId : LongInt;
begin
  inherited;
  frmAguarde.Mostra('Apagando Regra ...');
  frmAguarde.Refresh;

  If TabRegra.IsEmpty then Begin
    frmAguarde.Apaga;
    Exit;
  End;
  vId := TabRegra.FieldbyName('IDREGRA').AsInteger;
  while TabAlgRegra.Locate('IDREGRA',InttoStr(vId),[]) do
        TabAlgRegra.Delete;

  TabRegra.Delete;

  frmAguarde.Apaga;
end;

procedure TfrmImportarRegras.btnNovaFormulaClick(Sender: TObject);
var
   vId : LongInt;
begin
  inherited;
  if QryFormulaPdx.IsEmpty then
     Exit;
  frmAguarde.Mostra('Gerando nova fórmula ...');
  frmAguarde.Refresh;
  vId := QryFormulaPdx.FieldbyName('IDFORMULA').AsInteger;
  TabFormula.First;
  while not TabFormula.Eof do begin
        if TabFormula.FieldbyName('IDFORMULA').AsInteger = vId then begin
           TabFormula.Edit;
           TabFormula.FieldbyName('DESCRICAOFORMULA').AsString := TabFormula.FieldbyName('DESCRICAOFORMULA').AsString+' (Copia)';
           TabFormula.Post;
        end;
        TabFormula.Next;
  end;
  QryFormulaPdx.Close;
  QryFormulaPdx.Open;
  frmAguarde.Apaga;
end;

procedure TfrmImportarRegras.btnExcluirFormulaClick(Sender: TObject);
var
   vIdBD, vId : LongInt;
begin
  inherited;
  frmAguarde.Mostra('Apagando Fórmula ...');
  frmAguarde.Refresh;
  vIdBD := QryFormula.FieldbyName('IDFORMULA').AsInteger;

  if QryFormulaPdx.IsEmpty then
     Exit;
  vId := QryFormulaPdx.FieldbyName('IDFORMULA').AsInteger;
  while TabFormula.Locate('IDFORMULA',InttoStr(vId),[]) do
        TabFormula.Delete;

  while TabAlgRegra.Locate('FORMULA1;IDCAMPO2',VarArrayOf([vId, InttoStr(vId)]),[]) do begin
        TabAlgRegra.Edit;
        TabAlgRegra.FieldbyName('FORMULA1').AsInteger := vIdBD;
        TabAlgRegra.FieldbyName('IDCAMPO2').AsString := InttoStr(vIdBd);
        TabAlgRegra.Post;
  end;
  QryFormulaPdx.Close;
  QryFormulaPdx.Open;
  frmAguarde.Apaga;
end;

{******************************************************************************}
{ Importa Regras do Arquivo Selecionado                                        }
{------------------------------------------------------------------------------}
Procedure TfrmImportarRegras.bbtnConfirmarClick(Sender: TObject);
Var
  vVar1, vVar2, vVar3, vVar4, vVar5, vVar6, vVar7,
  vVar8, vSql, vId, vAux, sObrigatorio, sIdCampo, sTipoDado, sIdGrupo,
  sDscGrupo : String;
  TemGrupo, achou:Boolean;
  R, vSeqNew, vSeqOld, Maximo, nCont : LongInt;
  QryImpRegra : TwwQuery;
  sRegraImp, sRegraAux, sRegraImpIns :TStringList;
Begin
  Inherited;
  Executando := True;
  achou := False;
  nCont := 0;
  If TabRegra.IsEmpty Then
    Exit;

  sRegraImp    :=TStringList.Create;
  sRegraAux    :=TStringList.Create;
  sRegraImpIns :=TStringList.Create;
  QryImpRegra := TwwQuery.Create(Application);
    QryImpRegra.DatabaseName  := QryWrk.DatabaseName;
  rchedt.Lines.Add('STATUS DE IMPORTAÇÃO DE REGRAS');
  rchedt.Lines.Add('------------------------------');
  rchedt.Lines.Add('');

   try
      While Not TabRegra.EOF Do Begin
          vId  := TabRegra.FieldbyName('IDTIPOREGRA').AsString;
          vAux := TabRegra.FieldbyName('NOMEREGRA').AsString;
          vSeqOld := TabRegra.FieldbyName('IDREGRA').AsInteger;

          With QryImpRegra do begin

            Close;
            SQL.Clear;
            vSql := 'SELECT IDREGRA, NOMEREGRA, IDREGRA  FROM REGRA '+
                    'WHERE TRIM(UPPER(NOMEREGRA)) ='''+Trim(UpperCase(vAux))+''' AND IDREGRA ='+TabRegra.FieldbyName('OLDIDREGRA').AsString;
            SQL.Add(vSql);
            Open;
            if not Eof then
            begin
                 achou := True;
                  If RegraPublicada(QryImpRegra.FieldbyName('IDREGRA').AsString)  Then Begin      //Andre Oliveira SOL 169547/8741 KINTANA 1619963
                          MsgDlg('Regra cadastrada está publicada e não é permitida a alteração!','Atenção',mtWarning,[mbOk],0);//Andre Oliveira SOL 169547/8741 KINTANA 1619963
                          rchedt.Lines.Add('REGRA '+QryImpRegra.FieldbyName('IDREGRA').AsString+' / "'+
                                                    Copy(TabRegra.FieldbyName('NOMEREGRA').AsString,1,30)+
                                                    '" PUBLICADA, NAO FOI IMPORTADA! '+#13+
                                                    '      CLIQUE EM "NOVA REGRA" PARA IMPORTAR COM OUTRO NOME');
                  End
                  else
                      sRegraImp.Add(FieldbyName('IDREGRA').AsString+','+TabRegra.FieldbyName('OLDIDREGRA').AsString+','+'U');

            end;
          end;
          With QryImpRegra do begin

               Close;
               SQL.Clear;
               vSql := 'SELECT IDREGRA, NOMEREGRA, IDREGRA  FROM REGRA '+
                    'WHERE not TRIM(UPPER(NOMEREGRA)) ='''+Trim(UpperCase(vAux))+''' AND  IDREGRA ='+TabRegra.FieldbyName('OLDIDREGRA').AsString;
               SQL.Add(vSql);
               Open;
               if not IsEmpty then
               begin
                    achou := True;
                    if MsgDlg('Já existe uma regra com o mesmo identificador. Deseja sobrepor a regra existente ou criar uma nova regra?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
                    begin
                         With dtmRelDetalhes.QryPai Do Begin
                            Close;
                            ParambyName('ID').AsString := TabRegra.FieldbyName('OLDIDREGRA').AsString;
                            Open;

                            If Not IsEmpty Then Begin
                              MsgDlg('Esta regra está sendo utilizada por outra, '+#13+
                                     'seu nome não pode ser alterado!','Aviso',mtWarning,[mbOk],0);
                            End;
                            If RegraPublicada(QryImpRegra.FieldbyName('IDREGRA').AsString)  Then Begin      //Andre Oliveira SOL 169547/8741 KINTANA 1619963
                                MsgDlg('Regra cadastrada está publicada e não é permitida a alteração!','Atenção',mtWarning,[mbOk],0);//Andre Oliveira SOL 169547/8741 KINTANA 1619963
                                rchedt.Lines.Add('REGRA '+QryImpRegra.FieldbyName('IDREGRA').AsString+' / "'+
                                                          Copy(TabRegra.FieldbyName('NOMEREGRA').AsString,1,30)+
                                                          '" PUBLICADA, NAO FOI IMPORTADA! '+#13+
                                                          '      CLIQUE EM "NOVA REGRA" PARA IMPORTAR COM OUTRO NOME');

                            End
                            else
                                 sRegraImp.Add(QryImpRegra.FieldbyName('IDREGRA').AsString+','+TabRegra.FieldbyName('OLDIDREGRA').AsString+','+'U');
                            Close;

                          End;

                    end
                    else
                    begin
                         sRegraImp.Add(FieldbyName('IDREGRA').AsString+','+TabRegra.FieldbyName('OLDIDREGRA').AsString+','+'I');
                    end;
               end;
          end;
          With QryImpRegra do begin
             Close;
             SQL.Clear;
             vSql := 'SELECT IDREGRA, NOMEREGRA, IDREGRA  FROM REGRA '+
                  'WHERE TRIM(UPPER(NOMEREGRA)) ='''+Trim(UpperCase(vAux))+''' AND  NOT IDREGRA ='+TabRegra.FieldbyName('OLDIDREGRA').AsString;
             SQL.Add(vSql);
             Open;

             while not Eof do
             begin
               achou := True;
                 if MsgDlg('Já existe uma regra com o mesmo nome. Deseja sobrepor a regra existente ou criar uma nova regra?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
                 begin
                      If RegraPublicada(QryImpRegra.FieldbyName('IDREGRA').AsString)  Then Begin      //Andre Oliveira SOL 169547/8741 KINTANA 1619963
                          MsgDlg('Regra cadastrada está publicada e não é permitida a alteração!','Atenção',mtWarning,[mbOk],0);//Andre Oliveira SOL 169547/8741 KINTANA 1619963
                          rchedt.Lines.Add('REGRA '+QryImpRegra.FieldbyName('IDREGRA').AsString+' / "'+
                                                    Copy(TabRegra.FieldbyName('NOMEREGRA').AsString,1,30)+
                                                    '" PUBLICADA, NAO FOI IMPORTADA! '+#13+
                                                    '      CLIQUE EM "NOVA REGRA" PARA IMPORTAR COM OUTRO NOME');
                      End
                      else
                          sRegraImp.Add(FieldbyName('IDREGRA').AsString+','+TabRegra.FieldbyName('OLDIDREGRA').AsString+','+'U');
                 end
                 else
                 begin
                      sRegraImp.Add(FieldbyName('IDREGRA').AsString+','+TabRegra.FieldbyName('OLDIDREGRA').AsString+','+'I');
                 end;
                 Next;
             end;
          end;
          if (achou = False)then
             sRegraImpIns.Add(TabRegra.FieldbyName('OLDIDREGRA').AsString);
          TabRegra.Next;
      end;
   finally
        QryImpRegra.Free;
   end;

  If MsgDlg('Confirma Importação de Regras.','Confirma',
            mtConfirmation,[mbYes,mbNo],0) = mrNo Then
    Exit;

  PC.ActivePage := TbResultados;

  StartTransacao;



  {----------------------------------------------------------------------------}
  { Excluindo passos existentes caso desejado                                  }
  If CkBxExcluiPassos.Checked = True Then Begin
    { mensagens }
    frmAguarde.Mostra('Excluindo Passos das regras existentes ...');
    frmAguarde.Refresh;
    rchedt.Lines.Add('EXCLUINDO PASSOS DAS REGRAS EXISTENTES');

    { Exclui passos (Algoritmos) de todas as regras escolhidas }
    TabRegra.First;
    While Not TabRegra.EOF Do Begin
      { Verifica se regra é publicada }
      If RegraPublicada(TabRegra.FieldbyName('IDREGRA').AsString)  Then Begin
        TabRegra.Next;
        Continue;
      End;

      With QryWrk do begin
        Close;
        SQL.Clear;
        
        SQL.Add('DELETE FROM ALGREGRA '+
                'WHERE IDREGRA IN (SELECT IDREGRA FROM REGRA '+
                '                  WHERE RTRIM(NOMEREGRA)  = '+
                                   QuotedStr(Trim(TabRegra.FieldbyName('NOMEREGRA').AsString))+')' );
                
        
        Try
          ExecSql;
          rchedt.Lines.Add('PASSOS DA REGRA '+TabRegra.FieldbyName('NOMEREGRA').AsString+
                           ', EXCLUIDOS ');
        Except
          MsgDlg('Erro ao excluir passos desta Regra .','Erro',
                  mtError,[mbOk, mbHelp],0);
        End;
      End; { With }
      TabRegra.Next;
    End;  { While }

  End;
  { Exclusao das Regras Existentes                                             }
  {----------------------------------------------------------------------------}

  { Atualiza Tabelas }
  TabAlgRegra.Close;
  TabCmpBd.Close;
  TabCmpBdGrp.Close;
  tabFormula.Close;
  TabGrpArquivo.Close;
  tabGrpFormula.Close;
  TabRegra.Close;
  TabTipoRegra.Close;

  QryRegraBD.Close;
  QryRegraBD.Open;
  QryFormulaBD.Close;
  QryFormulaBD.Open;

  { Gera novos identificadores para as os Registros }
  TrataTabelas;

  TabAlgRegra.Open;
  TabCmpBd.Open;
  TabCmpBdGrp.Open;
  tabFormula.Open;
  TabGrpArquivo.Open;
  tabGrpFormula.Open;
  TabRegra.Open;
  TabTipoRegra.Open;
  QryTipoRegra.Close;
  QryTipoRegra.Open;


  {----------------------------------------------------------------------------}
  { Importa Dados das Auxiliares                                               }
  {----------------------------------------------------------------------------}

  { Copiando CMPBD  (Dicionario de Dados) }
  frmAguarde.Mostra('Importando Campos e Variaveis...');
  rchedt.Lines.Add('CAMPOS E VARIÁVEIS');
  frmAguarde.Pos := 1;
  frmAguarde.Max := TabCmpBd.RecordCount;
  frmAguarde.Min := 0;
  TabCmpBd.First;

  { Varre os dados do dicionário a serem importados e insere os que não existam }
  While Not TabCmpBd.Eof Do Begin
    vId := TabCmpBd.FieldbyName('IDCAMPO').AsString;
    With QryWrk Do Begin
      Close;
      Sql.Clear;
      vSql := 'SELECT IDCAMPO FROM CMPBD WHERE IDCAMPO='''+vId+'''';
      Sql.Add(vSql);
      Open;
    End;
    { Caso dado não exista no banco, insere}
    If QryWrk.IsEmpty Then Begin
      With QryWrk Do Begin
        Close;
        If Trim(TabCmpBd.FieldbyName('FLGOBRIGATORIO').AsString) = '' Then
          sObrigatorio := 'NULL'
        Else
          sObrigatorio := TabCmpBd.FieldbyName('FLGOBRIGATORIO').AsString;

        If Trim(TabCmpBd.FieldbyName('IDTIPODADO').AsString) = '' Then
          sTipoDado := 'NULL'
        Else
          sTipoDado := TabCmpBd.FieldbyName('IDTIPODADO').AsString;

        SQL.Clear;
        vSql := 'INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, '+
                'CHAVE, FLGOBRIGATORIO, APELIDO, IDTIPODADO) VALUES ('+
                ''''+TabCmpBd.FieldbyName('IDCAMPO').AsString+''', '+
                ''''+TabCmpBd.FieldbyName('ENTIDADE').AsString+''', '+
                ''''+TabCmpBd.FieldbyName('NOMEDOCAMPO').AsString+''', '+
                ''''+TabCmpBd.FieldbyName('DESCRICAODOCAMPO').AsString+''', '+
                     TabCmpBd.FieldbyName('CAMPODOBANCO').AsString+', '+
                     TabCmpBd.FieldbyName('CHAVE').AsString+', '+
                     sObrigatorio+', '+
                ''''+TabCmpBd.FieldbyName('APELIDO').AsString+''', '+
                     sTipoDado+')';
        SQL.Add(vSql);
        Try
          ExecSQL;
        Except
          rchedt.Lines.Add( ' Campo '+TabCmpBd.FieldbyName('IDCAMPO').AsString+' não importado. Erro na Inserção.');
          rchedt.Lines.Add( '     IdCampo : '+TabCmpBd.FieldbyName('IDCAMPO').AsString);
          rchedt.Lines.Add( '     Entidade : '+TabCmpBd.FieldbyName('Entidade').AsString);
          rchedt.Lines.Add( '     NomedoCampo : '+TabCmpBd.FieldbyName('NomedoCampo').AsString);
          rchedt.Lines.Add( '     DescricaodoCampo : '+TabCmpBd.FieldbyName('DescricaodoCampo').AsString);
          rchedt.Lines.Add( '     CampodoBanco : '+TabCmpBd.FieldbyName('CampodoBanco').AsString);
          rchedt.Lines.Add( '     Chave : '+TabCmpBd.FieldbyName('Chave').AsString);
          rchedt.Lines.Add( '     FlgObrigatorio : '+TabCmpBd.FieldbyName('FlgObrigatorio').AsString);
          rchedt.Lines.Add( '     Apelido : '+TabCmpBd.FieldbyName('Apelido').AsString);
          rchedt.Lines.Add( '     IdTipoDado : '+TabCmpBd.FieldbyName('IdTipoDado').AsString);
          rchedt.Lines.Add( ' COMANDO DE ENTRADA : '+vSql );
          rchedt.Lines.Add('');
        End;

      End; { With QryWrk }

    End; { If QryWrk.IsEmpty }

    TabCmpBd.Next;
    frmAguarde.Pos := frmAguarde.Pos + 1;

  End; { While Not TabCmpBd.}

  { Copiando GRPARQUIVO }

  frmAguarde.Mostra('Importando Grupos de Arquivos');
  frmAguarde.Refresh;
  rchedt.Lines.Add('GRUPOS DE ARQUIVOS');
  frmAguarde.Pos := 1;
  frmAguarde.Min := 0;
  frmAguarde.Max := TabGrpArquivo.RecordCount;
  TabGrpArquivo.First;

  { Varre os grupos a serem importados e insere os que não existem }
  While Not TabGrpArquivo.Eof Do Begin
    vId := TabGrpArquivo.FieldbyName('CODGRUPOARQUIVO').AsString;
    With QryWrk Do Begin
      Close;
      SQL.Clear;
      vSql := 'SELECT CODGRUPOARQUIVO FROM GRPARQUIVO WHERE CODGRUPOARQUIVO='''+vId+'''';
      SQL.Add(vSql);
      Open;
    End;
    { Caso grupo não exista no banco, insere}
    If QryWrk.IsEmpty then begin
      With QryWrk do begin
        Close;
        SQL.Clear;
        vSql := 'INSERT INTO GRPARQUIVO (CODGRUPOARQUIVO, DESCGRUPOARQUIVO, SETORGRUPOS) VALUES ('+
                ''''+TabGrpArquivo.FieldbyName('CODGRUPOARQUIVO').AsString+''', '+
                ''''+TabGrpArquivo.FieldbyName('DESCGRUPOARQUIVO').AsString+''', '+
                ''''+TabGrpArquivo.FieldbyName('SETORGRUPOS').AsString+''')';
        SQL.Add(vSql);
        Try
          ExecSQL;
        Except
          rchedt.Lines.Add( ' Grupo Arquivo '+TabGrpArquivo.FieldbyName('DESCGRUPOARQUIVO').AsString+' não importado. Erro na Inserção.');
          rchedt.Lines.Add( '     CODGRUPOARQUIVO : '+TabGrpArquivo.FieldbyName('CODGRUPOARQUIVO').AsString);
          rchedt.Lines.Add( '     DESCGRUPOARQUIVO : '+TabGrpArquivo.FieldbyName('DESCGRUPOARQUIVO').AsString);
          rchedt.Lines.Add( '     SETORGRUPOS '+TabGrpArquivo.FieldbyName('SETORGRUPOS').AsString);
          rchedt.Lines.Add( ' COMANDO DE ENTRADA : '+vSql );
          rchedt.Lines.Add('');
        End;
      End; { With QryWrk }

    End; { If QryWrk. }
    TabGrpArquivo.Next;
    frmAguarde.Pos := frmAguarde.Pos + 1;
  End; { While Not TabGrpArquivo. }

  { Copiando CMPBDGRP }

  frmAguarde.Mostra('Importando Grupos de Campos');
  frmAguarde.Refresh;
  rchedt.Lines.Add('GRUPOS DE CAMPOS');
  frmAguarde.Pos := 1;
  frmAguarde.Min := 0;
  frmAguarde.Max := TabCmpBdGrp.RecordCount;
  TabCmpBdGrp.First;

  { Varre os grupos a serem importados e insere os que não existem }
  While Not TabCmpBdGrp.Eof do begin
    vId := TabCmpBdGrp.FieldbyName('IDCAMPO').AsString;
    vAux := TabCmpBdGrp.FieldbyName('CODGRUPOARQUIVO').AsString;
    With QryWrk do begin
      Close;
      SQL.Clear;
      vSql := 'SELECT CODGRUPOARQUIVO, IDCAMPO FROM CMPBDGRP WHERE CODGRUPOARQUIVO='''+vAux+
              ''' AND IDCAMPO='''+vId+'''';
      SQL.Add(vSql);
      Open;
    End;
    { Caso grupo não exista no banco, insere}
    If QryWrk.IsEmpty then begin
      With QryWrk do begin
        Close;
        SQL.Clear;
        vSql := 'INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES ('+
                ''''+TabCmpBdGrp.FieldbyName('CODGRUPOARQUIVO').AsString+''', '+
                ''''+TabCmpBdGrp.FieldbyName('IDCAMPO').AsString+''')';
        SQL.Add(vSql);
        Try
          ExecSQL;
        Except
          rchedt.Lines.Add( ' Grupo Campo do BD '+TabCmpBdGrp.FieldbyName('IDCAMPO').AsString+' não importado. Erro na Inserção.');
          rchedt.Lines.Add( '     CODGRUPOARQUIVO : '+TabCmpBdGrp.FieldbyName('CODGRUPOARQUIVO').AsString);
          rchedt.Lines.Add( '     IDCAMPO : '+TabCmpBdGrp.FieldbyName('IDCAMPO').AsString);
          rchedt.Lines.Add( ' COMANDO DE ENTRADA : '+vSql );
          rchedt.Lines.Add('');
        End;
      End; { With QryWrk }

    End; { If QryWrk. }
    TabCmpBdGrp.Next;
    frmAguarde.Pos := frmAguarde.Pos + 1;
  End; { While Not TabCmpBdGrp. }


  {----------------------------------------------------------------------------}
  { Importa Dados das Regras                                                   }
  {----------------------------------------------------------------------------}

  { Copiando GRPFORMULA }

  frmAguarde.Mostra('Importando Grupos de Fórmulas');
  frmAguarde.Refresh;
  rchedt.Lines.Add('GRUPOS DE FORMULAS');
  frmAguarde.Pos := 1;
  frmAguarde.Min := 0;
  frmAguarde.Max := tabGrpFormula.RecordCount;
  tabGrpFormula.First;

  { Varre os grupos a serem importados e insere os que não existem }
  While not tabGrpFormula.Eof do begin
    vId := tabGrpFormula.FieldbyName('CODGRUPOFORMULA').AsString;
    With QryWrk do begin
      Close;
      SQL.Clear;
      vSql := 'SELECT CODGRUPOFORMULA FROM GRPFORMULA WHERE CODGRUPOFORMULA='''+vId+'''';
      SQL.Add(vSql);
      Open;
    End;
    { Caso grupo não exista no banco, insere}
    If QryWrk.IsEmpty then begin
      With QryWrk do begin
        Close;
        SQL.Clear;
        vSql := 'INSERT INTO GRPFORMULA (CODGRUPOFORMULA, DESCGRUPOFORMULA) VALUES ('+
                ''''+tabGrpFormula.FieldbyName('CODGRUPOFORMULA').AsString+''', '+
                ''''+tabGrpFormula.FieldbyName('DESCGRUPOFORMULA').AsString+''')';
        SQL.Add(vSql);
        Try
          ExecSQL;
        Except
          rchedt.Lines.Add( ' Grupo Formula '+tabGrpFormula.FieldbyName('DESCGRUPOFORMULA').AsString+' não importado. Erro de Inserção.');
          rchedt.Lines.Add( '     CODGRUPOFORMULA : '+tabGrpFormula.FieldbyName('CODGRUPOFORMULA').AsString);
          rchedt.Lines.Add( '     DESCGRUPOFORMULA : '+tabGrpFormula.FieldbyName('DESCGRUPOFORMULA').AsString);
          rchedt.Lines.Add( ' COMANDO DE ENTRADA : '+vSql );
          rchedt.Lines.Add('');
        End;
      End; { With QryWrk }

    End; { If QryWrk.IsEmpty }
    tabGrpFormula.Next;
    frmAguarde.Pos := frmAguarde.Pos + 1;
  End; { While not tabGrpFormula. }


  { Copiando TIPOREGRA }

  frmAguarde.Mostra('Importando Tipos de Regras');
  frmAguarde.Refresh;
  rchedt.Lines.Add('TIPOS DE REGRAS');
  frmAguarde.Pos := 1;
  frmAguarde.Min := 0;
  frmAguarde.Max := TabTipoRegra.RecordCount;
  tabTipoRegra.First;
  { Varre os Tipos de Regra a serem importados e insere os que não existem }
  While not tabTipoRegra.Eof do begin
    vId  := tabTipoRegra.FieldbyName('IDTIPOREGRA').AsString;
    vAux := tabTipoRegra.FieldbyName('DESCREGRA').AsString;
    vSeqOld := tabTipoRegra.FieldbyName('IDTIPOREGRA').AsInteger;
    If tabTipoRegra.FindField ('IDGRUPOREGRA') <> Nil Then Begin
      sIdGrupo  := tabTipoRegra.FieldbyName('IDGRUPOREGRA').AsString;
      sDscGrupo := tabTipoRegra.FieldbyName('DESCRICAO').AsString;
      TemGrupo := True;
    End Else Begin
      TemGrupo := False;
    End;

    With QryWrk do begin
      Close;
      SQL.Clear;
      vSql := 'SELECT IDTIPOREGRA, DESCREGRA FROM TIPOREGRA WHERE DESCREGRA ='''+vAux+'''';
      SQL.Add(vSql);
      Open;
    End;

    { Caso Tipo de Regra não exista no banco, insere}
    If QryWrk.IsEmpty then begin

      { Incrementa contador até achar um Id que não exista no Banco }
      vSeqNew := LeUltRegistro(nil,'TIPOREGRA');
      While QryTipoRegra.Locate('IDTIPOREGRA',vSeqNew,[]) do
        vSeqNew := LeUltRegistro(nil,'TIPOREGRA');

      { Inclui o Identificador na Tabela }
      TabTipoRegra.Edit;
      TabTipoRegra.FieldbyName('IDTIPOREGRA').AsInteger := vSeqNew;
      TabTipoRegra.Post;

      { Altera o Identificado do Tipo de Regra na Tabela de Regras }
      Maximo := 0;
      While TabRegra.Locate('IDTIPOREGRA', vSeqOld,[]) do begin
        TabRegra.Edit;
        TabRegra.FieldbyName('IDTIPOREGRA').AsInteger := vSeqNew;
        TabRegra.Post;
        If Maximo > TabRegra.RecordCount then
          Break;
        Inc(Maximo);
      End;

      { Verifica a existencia do Grupo de Regra deste Tipo de Regra }
      If (TemGrupo = True) Then Begin
        If (Not FazQuery(QryWrk,'SELECT IDGRUPOREGRA FROM GRUPOREGRA WHERE IDGRUPOREGRA = '+
                                sIdGrupo)) Then Begin
          ExecutarQuery(QryWrk,'INSERT INTO GRUPOREGRA VALUES ('+sIdGrupo+
                              ','+QuotedStr(sDscGrupo)+')');
        End;
      End;

      { Insere o Tipo de Regra no Banco }
      With QryWrk do begin
        Close;
        SQL.Clear;
        If TemGrupo = True Then Begin
          vSql := 'INSERT INTO TIPOREGRA (IDTIPOREGRA, DESCREGRA, IDGRUPOREGRA) VALUES ('+InttoStr(vSeqNew)+', '+
                  ''''+vAux+''','+sIdGrupo+')';
        End Else Begin
          vSql := 'INSERT INTO TIPOREGRA (IDTIPOREGRA, DESCREGRA) VALUES ('+InttoStr(vSeqNew)+', '+
                  ''''+vAux+''')';
        End;
        SQL.Add(vSql);
        Try
          ExecSQL;
        Except
          rchedt.Lines.Add( ' Tipo Regra '+vAux+' não importado. Erro de Inserção.');
          rchedt.Lines.Add( '        IDTIPOREGRA : '+TabTipoRegra.FieldbyName('IDTIPOREGRA').AsString);
          rchedt.Lines.Add( '        DESCREGRA : '+vAux);
          rchedt.Lines.Add( ' COMANDO DE ENTRADA : '+vSql );
          rchedt.Lines.Add('');
        End;

      End;

    End Else Begin
    { Caso exista Tipo de Regra...Mudar as chamadas a ele pelos dados do banco atual }

      vSeqNew := QryWrk.FieldbyName('IDTIPOREGRA').AsInteger;
      Maximo := 0;
      { Altera as Regras importadas para usar o mesmo Id do Banco }
      While TabRegra.Locate('IDTIPOREGRA', vSeqOld,[]) do begin
        TabRegra.Edit;
        TabRegra.FieldbyName('IDTIPOREGRA').AsInteger := vSeqNew;
        TabRegra.Post;

        If Maximo > TabRegra.RecordCount Then
          Break;

        Inc(Maximo);
      End;

      { Altera o Tipo de Regra para usar o mesmo Id do Banco }
      TabTipoRegra.Edit;
      TabTipoRegra.FieldbyName('IDTIPOREGRA').AsInteger := vSeqNew;
      TabTipoRegra.Post;

    End; { If QryWrk. }

    TabTipoRegra.Next;
    frmAguarde.Pos := frmAguarde.Pos + 1;

  End; { While not TabTipoRegra. }


  { Copiando Formulas }

  frmAguarde.Mostra('Importando Fórmulas');
  frmAguarde.Refresh;
  rchedt.Lines.Add('FORMULAS');
  frmAguarde.Pos := 1;
  frmAguarde.Min := 0;
  frmAguarde.Max := tabFormula.RecordCount;
  tabFormula.First;

  { Varre as Formulas a serem importados e insere os que não existem }
  While Not tabFormula.Eof do begin
    { Verifica se regra é publicada }

    vId := tabFormula.FieldbyName('CODGRUPOFORMULA').AsString;
    vAux := tabFormula.FieldbyName('DESCRICAOFORMULA').AsString;
    vSeqOld := tabFormula.FieldbyName('IDFORMULA').AsInteger;
    With QryWrk do begin
      Close;
      SQL.Clear;
      vSql := 'SELECT CODGRUPOFORMULA, DESCRICAOFORMULA, IDFORMULA  FROM FORMULA '+
              'WHERE DESCRICAOFORMULA='''+vAux+''' AND CODGRUPOFORMULA='''+vId+'''';
      SQL.Add(vSql);
      Open;
    End;

    { Caso grupo não exista no banco, insere}
    If (QryWrk.IsEmpty) or (FormulaPublicada(TabFormula.FieldbyName('IDANTIGO').AsString)) Then Begin

      { Incrementa contador até achar um Id que não exista no Banco }
      vSeqNew := LeUltRegistro(nil,'FORMULA');
      While QryFormulaBD.Locate('IDFORMULA',vSeqNew,[]) do
        vSeqNew := LeUltRegistro(nil,'FORMULA');

      { Inclui o Identificador na Tabela }
      tabFormula.Edit;
      tabFormula.FieldbyName('IDFORMULA').AsString := InttoStr(vSeqNew);
      tabFormula.Post;

      { Altera o Identificado das Formulas nos Algoritmos das Regras }
      tabAlgregra.First;
      While not tabAlgregra.EOF do begin
        If tabAlgregra.FieldbyName('IDCAMPO2').AsString = InttoStr(vSeqOld) then begin
          tabAlgregra.edit;
          tabAlgregra.FieldbyName('IDCAMPO2').AsString := InttoStr(vSeqNew);
          tabAlgregra.post;
        End;

        If tabAlgregra.FieldbyName('FORMULA1').AsString = InttoStr(vSeqOld) then begin
          tabAlgregra.edit;
          tabAlgregra.FieldbyName('FORMULA1').AsString := InttoStr(vSeqNew);
          tabAlgregra.post;
        End;
        tabAlgregra.Next;
      End;

      { Insere uma nova formula no BD de produção }
      With QryWrk do begin
        Close;
        SQL.Clear;
        vSql := 'INSERT INTO FORMULA (IDFORMULA, CODGRUPOFORMULA, EXPRESSAOFORMULA, '+
                'DESCRICAOFORMULA, EXPRESSAOREAL) VALUES ('+
                     TabFormula.FieldbyName('IDFORMULA').AsString+', '+
                ''''+TabFormula.FieldbyName('CODGRUPOFORMULA').AsString+''', '+
                ''''+TabFormula.FieldbyName('EXPRESSAOFORMULA').AsString+''', '+
                ''''+TabFormula.FieldbyName('DESCRICAOFORMULA').AsString+''', '+
                ''''+TabFormula.FieldbyName('EXPRESSAOREAL').AsString+''')';
        SQL.Add(vSql);
        Try
          ExecSQL;
        Except
          rchedt.Lines.Add( ' Formula Nº '+tabFormula.FieldbyName('IDFORMULA').AsString+'/'+
                            tabFormula.FieldbyName('DESCRICAOFORMULA').AsString+' não importado. Erro de Inserção.');
          rchedt.Lines.Add( '     IDFORMULA : '+tabFormula.FieldbyName('IDFORMULA').AsString);
          rchedt.Lines.Add( '     CODGRUPOFORMULA : '+tabFormula.FieldbyName('CODGRUPOFORMULA').AsString);
          rchedt.Lines.Add( '     EXPRESSAOFORMULA : '+tabFormula.FieldbyName('EXPRESSAOFORMULA').AsString);
          rchedt.Lines.Add( '     DESCRICAOFORMULA : '+tabFormula.FieldbyName('DESCRICAOFORMULA').AsString);
          rchedt.Lines.Add( '     EXPRESSAOREAL : '+tabFormula.FieldbyName('EXPRESSAOREAL').AsString);
          rchedt.Lines.Add( ' COMANDO DE ENTRADA : '+vSql );
          rchedt.Lines.Add('');
        End;
      End;
    End Else Begin
    { Caso exista Tipo de Regra...Mudar as chamadas a ele pelos dados do banco atual }

      vSeqNew := QryWrk.FieldbyName('IDFORMULA').AsInteger;
      tabFormula.Edit;
      tabFormula.FieldbyName('IDFORMULA').AsString := InttoStr(vSeqNew);
      tabFormula.Post;
      Maximo := 0;

      { Altera as Regras importadas para usar o mesmo Id do Banco }
      While tabAlgregra.Locate('TIPOCAMPO2;FORMULA1',VarArrayOf(['4',InttoStr(vSeqOld)]),[]) do begin
        tabAlgregra.edit;
        tabAlgregra.FieldbyName('IDCAMPO2').AsString := InttoStr(vSeqNew);
        tabAlgregra.FieldbyName('FORMULA1').AsString := InttoStr(vSeqNew);
        tabAlgregra.post;
        If Maximo > tabAlgregra.RecordCount then
          Break;
        Inc(Maximo);
      End;

      { Altera na Tabela AlgRegra (Pdx) para o novo numero de IdFormula }
      With QryWrk do begin
        Close;
        SQL.Clear;
        
        vSQL := 'UPDATE FORMULA '+
                'SET '+
                'CODGRUPOFORMULA = '''+tabFormula.fieldbyname('CODGRUPOFORMULA').AsString+''', '+
                'EXPRESSAOFORMULA = '''+tabFormula.FieldbyName('EXPRESSAOFORMULA').AsString+''', '+
                'DESCRICAOFORMULA = '''+tabFormula.FieldbyName('DESCRICAOFORMULA').AsString+''', '+
                'EXPRESSAOREAL = '''+tabFormula.FieldbyName('EXPRESSAOREAL').AsString+''' '+
                'WHERE IDFORMULA = '+InttoStr(vSeqNew);
        SQL.Add(vSql);
        Try
          ExecSQL;
        Except
          rchedt.Lines.Add( ' Formula Nº '+InttoStr(vSeqNew)+'/'+tabFormula.FieldbyName('DESCRICAOFORMULA').AsString+' não atualizado. Erro de Atualização (Update)');
          rchedt.Lines.Add( '     IDFORMULA : '+tabFormula.FieldbyName('IDFORMULA').AsString);
          rchedt.Lines.Add( '     CODGRUPOFORMULA : '+tabFormula.FieldbyName('CODGRUPOFORMULA').AsString);
          rchedt.Lines.Add( '     EXPRESSAOFORMULA : '+tabFormula.FieldbyName('EXPRESSAOFORMULA').AsString);
          rchedt.Lines.Add( '     DESCRICAOFORMULA : '+tabFormula.FieldbyName('DESCRICAOFORMULA').AsString);
          rchedt.Lines.Add( '     EXPRESSAOREAL : '+tabFormula.FieldbyName('EXPRESSAOREAL').AsString);
          rchedt.Lines.Add( ' COMANDO DE ENTRADA : '+vSql );
          rchedt.Lines.Add('');
        End;
      End;
    End;
    TabFormula.Next;
    frmAguarde.Pos := frmAguarde.Pos + 1;
  End;

  { Copiando REGRA }


  for nCont := 0 to  sRegraImp.Count-1 do
  begin
       sRegraAux.Clear;
       Split(',', sRegraImp.Strings[nCont], sRegraAux);
       ImportaRegrasNomes(sRegraAux.Strings[0], sRegraAux.Strings[1], sRegraAux.Strings[2]);

  end;

  for nCont := 0 to  sRegraImpIns.Count -1 do
  begin
    frmAguarde.Mostra('Importando Regras');
    frmAguarde.Refresh;
    rchedt.Lines.Add('REGRAS');
    frmAguarde.Pos := 1;
    frmAguarde.Min := 0;
    frmAguarde.Max := TabRegra.RecordCount;
    TabRegra.First;
    While TabRegra.Locate('OLDIDREGRA', sRegraImpIns.Strings[nCont],[]) do begin


      { Varre as Regras a serem importados e insere os que não existem }

      If TabRegra.FieldbyName('OLDIDREGRA').AsString = sRegraImpIns.Strings[nCont] then begin
      // Fim Andre Oliveira SOL 169547/8741 KINTANA 1619963
      vId  := TabRegra.FieldbyName('IDTIPOREGRA').AsString;
      vAux := TabRegra.FieldbyName('NOMEREGRA').AsString;
      vSeqOld := TabRegra.FieldbyName('IDREGRA').AsInteger;

        vSeqNew := TabRegra.FieldbyName('IDREGRA').AsInteger;
        With QryWrk do begin
          Close;
          SQL.Clear;
          { Monta SQL de Inserção da nova Regra }
          vSql := 'INSERT INTO REGRA (IDREGRA, IDTIPOREGRA, NOMEREGRA, DESCRICAOREGRA, PUBLICADA'+
                  ') VALUES ('+
                       IntToStr(vSeqNew)+','+
                       TabRegra.FieldbyName('IDTIPOREGRA').AsString+','+
                  ''''+Copy(Trim(TabRegra.FieldbyName('NOMEREGRA').AsString),1,60)+''','+
                  ''''+TabRegra.FieldbyName('DESCRICAOREGRA').AsString+''','+
                  ''''+'0'+''')';

          SQL.Add(vSql);

          Try
            ExecSQL;
            rchedt.Lines.Add('Regra nº '+IntToStr(vSeqNew)+' / '+
                             TabRegra.FieldbyName('NOMEREGRA').AsString+
                             ', importada com sucessso.');
          Except
            on e:exception do begin
              rchedt.Lines.Add( ' Regra nº '+InttoStr(vSeqNew)+'/'+TabRegra.FieldbyName('NOMEREGRA').AsString+' não importado. Erro de Inserção.');
              rchedt.Lines.Add( '     IDREGRA        :'+TabRegra.FieldbyName('IDREGRA').AsString);
              rchedt.Lines.Add( '     IDTIPOREGRA    :'+TabRegra.FieldbyName('IDTIPOREGRA').AsString);
              rchedt.Lines.Add( '     NOMEREGRA      :'+TabRegra.FieldbyName('NOMEREGRA').AsString);
              rchedt.Lines.Add( '     DESCRICAOREGRA :'+TabRegra.FieldbyName('DESCRICAOREGRA').AsString);
              rchedt.Lines.Add( '     PUBLICADA      :0' );
              rchedt.Lines.Add( ' COMANDO DE ENTRADA : ' );
              rchedt.Lines.Add( '   '+vSql );
              rchedt.Lines.Add('');
              rchedt.Lines.Add('MENSAGEM .: '+e.Message);
            end;
          End;
        End;
      End;
      TabRegra.Next;
      frmAguarde.Pos := frmAguarde.Pos + 1;

    end;
  { Copiando ALGREGRA }

     frmAguarde.Mostra('Importando Passos das Regras');
     frmAguarde.Refresh;
     rchedt.Lines.Add('PASSOS DAS REGRAS');
     frmAguarde.Pos := 1;
     frmAguarde.Min := 0;
     frmAguarde.Max := TabAlgRegra.RecordCount;
     TabAlgRegra.First;

  { Varre os algoritmos da Regra a ser importada e insere os que não existem }

      While not TabAlgRegra.Eof do begin
        if TabAlgRegra.FieldbyName('OLDIDREGRA').AsString = sRegraImpIns.Strings[nCont] then begin

        { Verifica se regra é publicada }
          If RegraPublicada( IntToStr( vSeqNew ) ) Then Begin
            TabAlgRegra.Next;
            Continue;
          End;

          { Verifica se a Regra já existe }
          with QryWrk do begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT IDREGRA, IDALGORITMODAREG FROM ALGREGRA WHERE ');
            SQL.Add('IDREGRA = '+TabAlgRegra.FieldbyName('IDREGRA').AsString);
            SQL.Add(' AND IDALGORITMODAREG = '+TabAlgRegra.FieldbyName('IDALGORITMODAREG').AsString);
            Open;
          end;
          vVar1 := '';
          vVar2 := '';
          vVar3 := '';
          vVar4 := '';
          vVar5 := '';
          vVar6 := '';
          vVar7 := '';
          vVar8 := '';

          { Prepara Variaveis }
          try
            if InttoStr(TabAlgRegra.FieldbyName('FORMULA2').AsInteger) <> '0' then
              vVar1 := TabAlgRegra.FieldbyName('FORMULA2').AsString;
          except
            vVar1 := 'NULL';
          end;
          if vVar1 = '' then
            vVar1 := 'NULL';

          try
            if InttoStr(TabAlgRegra.FieldbyName('TIPOALGORITMO').AsInteger) <> '0' then
              vVar2 := TabAlgRegra.FieldbyName('TIPOALGORITMO').AsString;
          except
            vVar2 := '''''';
          end;

          try
            if InttoStr(TabAlgRegra.FieldbyName('ALGORSUBSEQTRUE').AsInteger) <> '0' then
              vVar3 := TabAlgRegra.FieldbyName('ALGORSUBSEQTRUE').AsString;
          except
            vVar3 := 'NULL';
          end;

          if vVar3 = '' then
            vVar3 := 'NULL';

          try
            if InttoStr(TabAlgRegra.FieldbyName('FORMULA1').AsInteger) <> '0' then
              vVar4 := TabAlgRegra.FieldbyName('FORMULA1').AsString;
          except
            vVar4 := 'NULL';
          end;

          if vVar4 = '' then
            vVar4 := 'NULL';

          try
            if InttoStr(TabAlgRegra.FieldbyName('ALGORSUBSEQFALSE').AsInteger) <> '0' then
              vVar5 := TabAlgRegra.FieldbyName('ALGORSUBSEQFALSE').AsString;
          except
            vVar5 := 'NULL';
          end;

          if vVar5 = '' then
            vVar5 := 'NULL';

          If Trim(TabAlgRegra.FieldbyName('IDCAMPO').AsString) = '' Then
            sIdCampo := 'NULL'
          Else
            sIdCampo := QuotedStr(TabAlgRegra.FieldbyName('IDCAMPO').AsString);

          vVar6 := TabAlgRegra.FieldbyName('TIPOCAMPO1').AsString;
          vVar7 := TabAlgRegra.FieldbyName('TIPOCAMPO2').AsString;

          try
            if InttoStr(TabAlgRegra.FieldbyName('FORMATACAO').AsInteger) <> '0' then
              vVar8 := TabAlgRegra.FieldbyName('FORMATACAO').AsString;
          except
            vVar8 := 'NULL';
          end;

          if vVar8 = '' then
            vVar8 := 'NULL';

          { Caso não tenha encontrado algoritmo, insere }
          if QryWrk.IsEmpty then begin
            with QryWrk do begin
              Close;
              SQL.Clear;
              vSql :=   'INSERT INTO ALGREGRA (IDREGRA, IDALGORITMODAREG, IDCAMPO, FORMULA1, CORRELACAO, '+
                        'FORMULA2, IDCAMPO2, VALOR, TIPOALGORITMO, DESCRICAOALGORIT, ALGORSUBSEQTRUE, '+
                        'ALGORSUBSEQFALSE, TIPOCAMPO1, TIPOCAMPO2, FORMATACAO) VALUES ('+
                             TabAlgRegra.FieldbyName('IDREGRA').AsString+','+
                             TabAlgRegra.FieldbyName('IDALGORITMODAREG').AsString+','+
                             sIdCampo+','+
                        vVar4+','+
                        ''''+TabAlgRegra.FieldbyName('CORRELACAO').AsString+''','+
                        vVar1+','+
                        ''''+TabAlgRegra.FieldbyName('IDCAMPO2').AsString+''','+
                        ''''+TabAlgRegra.FieldbyName('VALOR').AsString+''','+
                        vVar2+','+
                        ''''+TabAlgRegra.FieldbyName('DESCRICAOALGORIT').AsString+''','+
                        vVar3+','+
                        VVar5+','+
                        vVar6+','+
                        vVar7+','+
                        vVar8+')';
              SQL.Add(vSql);
              try
                ExecSQL;
              except
                on e:exception do begin
                  rchedt.Lines.Add( ' Regra Nº '+TabAlgRegra.FieldbyName('IDREGRA').AsString+
                                    ' Passo '+TabAlgRegra.FieldbyName('IDALGORITMODAREG').AsString+'. Erro de Inserção.');
                  rchedt.Lines.Add('      IDREGRA : '+TabAlgRegra.FieldbyName('IDREGRA').AsString);
                  rchedt.Lines.Add('      IDALGORITMODAREG : '+TabAlgRegra.FieldbyName('IDALGORITMODAREG').AsString);
                  rchedt.Lines.Add('      IDCAMPO : '+TabAlgRegra.FieldbyName('IDCAMPO').AsString);
                  rchedt.Lines.Add('      FORMULA1 : '+TabAlgRegra.FieldbyName('FORMULA1').AsString);
                  rchedt.Lines.Add('      CORRELACAO : '+TabAlgRegra.FieldbyName('CORRELACAO').AsString);
                  rchedt.Lines.Add('      FORMULA2 : '+TabAlgRegra.FieldbyName('FORMULA2').AsString);
                  rchedt.Lines.Add('      IDCAMPO2 : '+TabAlgRegra.FieldbyName('IDCAMPO2').AsString);
                  rchedt.Lines.Add('      VALOR : '+TabAlgRegra.FieldbyName('VALOR').AsString);
                  rchedt.Lines.Add('      TIPOALGORITMO : '+TabAlgRegra.FieldbyName('TIPOALGORITMO').AsString);
                  rchedt.Lines.Add('      DESCRICAOALGORIT : '+TabAlgRegra.FieldbyName('DESCRICAOALGORIT').AsString);
                  rchedt.Lines.Add('      ALGORSUBSEQTRUE : '+TabAlgRegra.FieldbyName('ALGORSUBSEQTRUE').AsString);
                  rchedt.Lines.Add('      ALGORSUBSEQFALSE : '+TabAlgRegra.FieldbyName('ALGORSUBSEQFALSE').AsString);
                  rchedt.Lines.Add('      TIPOCAMPO1 : '+TabAlgRegra.FieldbyName('TIPOCAMPO1').AsString);
                  rchedt.Lines.Add('      TIPOCAMPO2 : '+TabAlgRegra.FieldbyName('TIPOCAMPO2').AsString);
                  rchedt.Lines.Add('      FORMATACAO : '+TabAlgRegra.FieldbyName('FORMATACAO').AsString);
                  rchedt.Lines.Add(' COMANDO DE ENTRADA : '+vSql );
                  rchedt.Lines.Add('');
                  rchedt.Lines.Add('MENSAGEM .: '+e.Message);
                end;

              end;
            end;
          end else begin
          { Caso exista o algoritmo, Atualiza }
            with QryWrk do begin
              Close;
              SQL.Clear;
        
              vSql :=   'UPDATE ALGREGRA SET '+
                        'IDALGORITMODAREG = '+TabAlgRegra.FieldbyName('IDALGORITMODAREG').AsString+','+
                        'IDCAMPO = '+sIdCampo+','+
                        'FORMULA1 = '+vVar4+','+
                        'CORRELACAO = '''+TabAlgRegra.FieldbyName('CORRELACAO').AsString+''','+
                        'FORMULA2 = '+vVar1+','+
                        'IDCAMPO2 = '''+TabAlgRegra.FieldbyName('IDCAMPO2').AsString+''','+
                        'VALOR = '''+TabAlgRegra.FieldbyName('VALOR').AsString+''','+
                        'TIPOALGORITMO = '+vVar2+','+
                        'DESCRICAOALGORIT = '''+TabAlgRegra.FieldbyName('DESCRICAOALGORIT').AsString+''','+
                        'ALGORSUBSEQTRUE = '+vVar3+','+
                        'ALGORSUBSEQFALSE = '+VVar5+','+
                        'TIPOCAMPO1 = '+vVar6+','+
                        'TIPOCAMPO2 = '+vVar7+','+
                        'FORMATACAO = '+vVar8+' WHERE IDREGRA = '+TabAlgRegra.FieldbyName('IDREGRA').AsString+' AND '+
                        'IDALGORITMODAREG = '+TabAlgRegra.FieldbyName('IDALGORITMODAREG').AsString;
              SQL.Add(vSql);
              try
                ExecSQL;
              except
                rchedt.Lines.Add( ' Regra Nº '+TabAlgRegra.FieldbyName('IDREGRA').AsString+
                                  ' Passo '+TabAlgRegra.FieldbyName('IDALGORITMODAREG').AsString+'. Erro de Atualização.');
                rchedt.Lines.Add('      IDREGRA : '+TabAlgRegra.FieldbyName('IDREGRA').AsString);
                rchedt.Lines.Add('      IDALGORITMODAREG : '+TabAlgRegra.FieldbyName('IDALGORITMODAREG').AsString);
                rchedt.Lines.Add('      IDCAMPO : '+TabAlgRegra.FieldbyName('IDCAMPO').AsString);
                rchedt.Lines.Add('      FORMULA1 : '+TabAlgRegra.FieldbyName('FORMULA1').AsString);
                rchedt.Lines.Add('      CORRELACAO : '+TabAlgRegra.FieldbyName('CORRELACAO').AsString);
                rchedt.Lines.Add('      FORMULA2 : '+TabAlgRegra.FieldbyName('FORMULA2').AsString);
                rchedt.Lines.Add('      IDCAMPO2 : '+TabAlgRegra.FieldbyName('IDCAMPO2').AsString);
                rchedt.Lines.Add('      VALOR : '+TabAlgRegra.FieldbyName('VALOR').AsString);
                rchedt.Lines.Add('      TIPOALGORITMO : '+TabAlgRegra.FieldbyName('TIPOALGORITMO').AsString);
                rchedt.Lines.Add('      DESCRICAOALGORIT : '+TabAlgRegra.FieldbyName('DESCRICAOALGORIT').AsString);
                rchedt.Lines.Add('      ALGORSUBSEQTRUE : '+TabAlgRegra.FieldbyName('ALGORSUBSEQTRUE').AsString);
                rchedt.Lines.Add('      ALGORSUBSEQFALSE : '+TabAlgRegra.FieldbyName('ALGORSUBSEQFALSE').AsString);
                rchedt.Lines.Add('      TIPOCAMPO1 : '+TabAlgRegra.FieldbyName('TIPOCAMPO1').AsString);
                rchedt.Lines.Add('      TIPOCAMPO2 : '+TabAlgRegra.FieldbyName('TIPOCAMPO2').AsString);
                rchedt.Lines.Add('      FORMATACAO : '+TabAlgRegra.FieldbyName('FORMATACAO').AsString);
                rchedt.Lines.Add( ' COMANDO DE ENTRADA : '+vSql );
                rchedt.Lines.Add('');
              end;
            end;
          end;
        End;
        TabAlgRegra.Next;
        frmAguarde.Pos := frmAguarde.Pos + 1;
      end;
  End;

  { Confirma a Transação }
  frmAguarde.Apaga;
  Executando := False;
  If MsgDlg('Confirma Gravação de Dados ?','Confirma',
            mtConfirmation,[mbYes,mbNo],0) = mrYes
  Then Begin
    { Grava Log da operação - 19/12/2002 }
    If Not Sistema.GravaLogOperacoes('Importação de Regras') Then
      Raise Exception.Create('Não Consegui Gravar o Log');
    frmAguarde.Mostra('Finalizando operação ...');
    frmAguarde.Refresh;
    frmAguarde.Apaga;

    rchedt.Lines.Add('');
    rchedt.Lines.Add('Gravação efetuada com sucesso.');
    rchedt.Lines.Add('');

    CommitTransacao;
  End Else Begin
    frmAguarde.Mostra('Cancelando operação ...');
    frmAguarde.Refresh;
    frmAguarde.Apaga;

    rchedt.Lines.Add('');
    rchedt.Lines.Add('Operação cancelada pelo usuário.');
    rchedt.Lines.Add('');

    RollBackTransacao;
  End;

  { Fecha Tabelas utilizadas }
  TabRegra.Close;
  TabAlgRegra.Close;
  TabCmpBd.Close;
  TabCmpBdGrp.Close;
  TabFormula.Close;
  TabGrpArquivo.Close;
  tabGrpFormula.Close;
  TabTipoRegra.Close;
  Executando := False;

  { Fecha Tabelas }
  QryPassosPdx.Open;
  QryAlgregra.Close;
  QryFormulaBD.Open;


end;

procedure TfrmImportarRegras.btnDescompactarClick(Sender: TObject);
begin
  Inherited;
  { Busca Aquivo com as Regras e Descomprime na Pasta C:\TEMP }
  Od.Execute;

  If Od.FileName <> '' then begin
    { Fecha consultas para liberar tabelas a excluir }
    QryRegraView.Close;
    TabAlgRegra.Close;
    TabCmpBd.Close;
    TabCmpBdGrp.Close;
    tabFormula.Close;
    TabGrpArquivo.Close;
    tabGrpFormula.Close;
    TabRegra.Close;
    TabTipoRegra.Close;
    QryRegraBD.Close;
    QryFormulaBD.Close;

    { Deleta os arquivos existentes }
    //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
    //if FileExists('C:\TEMP\REGRA.DB')      then  DeleteFile('C:\TEMP\REGRA.DB');
      if FileExists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\REGRA.DB')      then  DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\REGRA.DB');

    //if FileExists('C:\TEMP\REGRA.MB')      then  DeleteFile('C:\TEMP\REGRA.MB');
      if FileExists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\REGRA.MB')      then  DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\REGRA.MB');

    //if FileExists('C:\TEMP\ALGREGRA.DB')   then  DeleteFile('C:\TEMP\ALGREGRA.DB');
      if FileExists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\ALGREGRA.DB')      then  DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\ALGREGRA.MB');

    //if FileExists('C:\TEMP\CMPBD.DB')      then  DeleteFile('C:\TEMP\CMPBD.DB');
      if FileExists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CMPBD.DB')      then  DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CMPBD.DB');

    //if FileExists('C:\TEMP\CMPBDGRP.DB')   then  DeleteFile('C:\TEMP\CMPBDGRP.DB');
      if FileExists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CMPBDGRP.DB')   then  DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CMPBDGRP.DB');

    //if FileExists('C:\TEMP\FORMULA.DB')    then  DeleteFile('C:\TEMP\FORMULA.DB');
      if FileExists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\FORMULA.DB')    then  DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\FORMULA.DB');

    //if FileExists('C:\TEMP\GRPARQUIVO.DB') then  DeleteFile('C:\TEMP\GRPARQUIVO.DB');
      if FileExists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\GRPARQUIVO.DB') then  DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\GRPARQUIVO.DB');

    //if FileExists('C:\TEMP\GRPFORMULA.DB') then  DeleteFile('C:\TEMP\GRPFORMULA.DB');
      if FileExists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\GRPFORMULA.DB') then  DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\GRPFORMULA.DB');

    //if FileExists('C:\TEMP\TIPOREGRA.DB')  then  DeleteFile('C:\TEMP\TIPOREGRA.DB');
      if FileExists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\TIPOREGRA.DB')  then  DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\TIPOREGRA.DB');

    //if FileExists('C:\TEMP\TIPOREGRA.MB')  then  DeleteFile('C:\TEMP\TIPOREGRA.MB');
      if FileExists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\TIPOREGRA.MB')  then  DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\TIPOREGRA.MB');

    { Prepara e Descomprime arquivo }
    ZipMaster1.ZipFilename := Od.FileName;
    //ZipMaster1.ExtrBaseDir := 'C:\TEMP';
    ZipMaster1.ExtrBaseDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
    ZipMaster1.Extract;
  End;

End;

procedure TfrmImportarRegras.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if Executando then begin
     RollBackTransacao;
     Executando := False;
  end;
end;

procedure TfrmImportarRegras.TrataTabelas;
Var
  vIdOld, vIdNew : LongInt;
begin
  TabTipoRegra.Open;
  TabTipoRegra.First;

  TabTipoRegra.Open;
  TabRegra.Open;
  TabAlgRegra.Open;
  TabFormula.Open;

  frmAguarde.Mostra('Tratando Regras ...');
  frmAguarde.Refresh;
  frmAguarde.Max := TabRegra.RecordCount;
  frmAguarde.Min := 0;
  frmAguarde.Pos := 0;
  TabRegra.First;

  while not TabRegra.Eof do begin
    vIdOld := TabRegra.FieldbyName('IDREGRA').AsInteger;

    vIdNew := vIdOld; 
    while QryRegraBD.Locate('IDREGRA',vIdNew,[]) do
      vIdNew := LeUltRegistro(NIL,'REGRA');

    TabRegra.Edit;
    TabRegra.FieldbyName('IDREGRA').AsInteger := vIdNew;
    TabRegra.FieldbyName('TIPO').AsInteger := 1;
    TabRegra.Post;

    while TabAlgRegra.Locate('IDREGRA;TIPO',varArrayOf([vIdOld,0]),[]) do begin
      TabAlgRegra.Edit;
      TabAlgRegra.FieldbyName('IDREGRA').AsInteger := vIdNew;
      TabAlgRegra.FieldbyName('TIPO').AsInteger := 1;
      TabAlgRegra.Post;
    end;

    while TabAlgRegra.Locate('IDCAMPO2;FORM;TIPOALGORITMO',varArrayOf([vIdOld,0,14]),[]) do begin
      TabAlgRegra.Edit;
      TabAlgRegra.FieldbyName('IDCAMPO2').AsInteger := vIdNew;
      TabAlgRegra.FieldbyName('FORM').AsInteger := 1;
      TabAlgRegra.Post;
    end;

    frmAguarde.Pos := frmAguarde.Pos + 1;
    TabRegra.Next;
  end;

  TabAlgRegra.Close;
  TabAlgRegra.Open;

  frmAguarde.Mostra('Tratando Formulas ...');
  frmAguarde.Refresh;
  frmAguarde.Max := TabFormula.RecordCount;
  frmAguarde.Min := 0;
  frmAguarde.Pos := 0;
  TabFormula.First;
  while not TabFormula.Eof do begin
    vIdOld := TabFormula.FieldbyName('IDANTIGO').AsInteger;
    vIdNew := TabFormula.FieldbyName('IDFORMULA').AsInteger;
    while TabAlgRegra.Locate('FORMULA1;IDCAMPO2',varArrayOf([vIdOld, InttoStr(vIdOld)]),[]) do begin
      TabAlgRegra.Edit;
      TabAlgRegra.FieldbyName('FORMULA1').AsInteger := vIdNew;
      TabAlgRegra.FieldbyName('IDCAMPO2').AsString := InttoStr(vIdNew);
      TabAlgRegra.Post;
    end;
    TabFormula.Next;
    frmAguarde.Pos := frmAguarde.Pos + 1;
  end;


  frmAguarde.Min := 0;
  frmAguarde.Pos := 0;
  TabFormula.First;
  while not TabFormula.Eof do begin
    vIdOld := TabFormula.FieldbyName('IDFORMULA').AsInteger;

    vIdNew := LeUltRegistro(nil,'FORMULA');
    while QryFormulaBD.Locate('IDFORMULA',vIdNew,[]) do
      vIdNew := LeUltRegistro(nil,'FORMULA');

    TabFormula.Edit;
    TabFormula.FieldbyName('IDFORMULA').AsInteger := vIdNew;
    TabFormula.Post;

    while TabAlgRegra.Locate('FORMULA1;IDCAMPO2',varArrayOf([vIdOld, InttoStr(vIdOld)]),[]) do begin
      TabAlgRegra.Edit;
      TabAlgRegra.FieldbyName('FORMULA1').AsInteger := vIdNew;
      TabAlgRegra.FieldbyName('IDCAMPO2').AsString := InttoStr(vIdNew);
      TabAlgRegra.Post;
    end;

    TabFormula.Next;
    frmAguarde.Pos := frmAguarde.Pos + 1;
  end;

  TabTipoRegra.Open;
  TabRegra.Open;
  TabAlgRegra.Open;
  TabFormula.Open;

  frmAguarde.Apaga;
end;




procedure TfrmImportarRegras.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  //Jéssica Lana SOL 109421 KINTANA 496332
  //if fileexists('c:\temp\regra.db') then  DeleteFile('c:\temp\regra.db');
    if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\regra.db') then
    DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\regra.db');

  //if fileexists('c:\temp\regra.mb') then  DeleteFile('c:\temp\regra.mb');
    if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\regra.mb') then
    DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\regra.mb');

  //if fileexists('c:\temp\algregra.db') then  DeleteFile('c:\temp\algregra.db');
    if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\algregra.db') then
    DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\algregra.db');

  //if fileexists('c:\temp\cmpbd.db') then  DeleteFile('c:\temp\cmpbd.db');
    if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\cmpbd.db') then
    DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\cmpbd.db');

  //if fileexists('c:\temp\cmpbdgrp.db') then  DeleteFile('c:\temp\cmpbdgrp.db');
     if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\cmpbdgrp.db') then
     DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\cmpbdgrp.db');

  //if fileexists('c:\temp\formula.db') then  DeleteFile('c:\temp\formula.db');
    if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\formula.db') then
    DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\formula.db');

  //if fileexists('c:\temp\grparquivo.db') then  DeleteFile('c:\temp\grparquivo.db');
    if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\grparquivo.db') then
    DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\grparquivo.db');

  //if fileexists('c:\temp\grpformula.db') then  DeleteFile('c:\temp\grpformula.db');
    if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\grpformula.db') then
    DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\grpformula.db');

  //if fileexists('c:\temp\tiporegra.db') then  DeleteFile('c:\temp\tiporegra.db');
    if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\tiporegra.db') then
    DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\tiporegra.db');

  //if fileexists('c:\temp\tiporegra.mb') then  DeleteFile('c:\temp\tiporegra.mb');}
    if fileexists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\tiporegra.mb') then
    DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\tiporegra.mb');

end;

procedure TfrmImportarRegras.SbtnSalvarClick(Sender: TObject);
begin
  inherited;
  Sd.Execute;
  if Sd.FileName <> '' then
     rchedt.Lines.SaveToFile(Sd.FileName);
end;

procedure TfrmImportarRegras.BtExcPassosClick(Sender: TObject);
begin
  inherited;
  { Exclui passos (Algoritmos) existentes das Regras escolhidas }
  With QryWrk do begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM ALGREGRA WHERE IDREGRA = '+TabRegra.FieldbyName('IDREGRA').AsString);
    Try
      ExecSql;
    Except
      MsgDlg('Erro ao excluir passos desta Regra .','Erro',
              mtError,[mbOk,mbHelp],0);
    End;
  End;
  { Reabre a Conlusta de Passos }
  with QryAlgregra do begin
       Close;
       ParambyName('ID').AsInteger := QryRegraView.FieldbyName('IDREGRA').AsInteger;
       Open;
  end;

end;

procedure TfrmImportarRegras.FormShow(Sender: TObject);
begin
  inherited;
   { Verifica a existencia da pasta C:\TEMP, caso não exista, Cria }
  //Jéssica Lana Nunes dos Santos 109421 KINTANA 496332
  //If Not DirectoryExists('C:\TEMP') Then Begin
        If Not DirectoryExists(Sistema.retornaCaminhoArquivos(Sistema.IdEmpresa)) Then Begin
    //CreateDir('C:\TEMP');
        CreateDir(Sistema.retornaCaminhoArquivos(Sistema.IdEmpresa));
  End;
  Executando := False;
end;

procedure TfrmImportarRegras.Button1Click(Sender: TObject);
begin
  inherited;
  Table1.Open;
end;

{==============================================================================}
{ Retorna se Regra é publicada ou não                                          }
function TfrmImportarRegras.RegraPublicada(IdRegra: String): Boolean;
begin
  Result := False;
  If FazQuery(QryWrk,'SELECT IDREGRA FROM REGRA '+
                     'WHERE IDREGRA   = '+ IdRegra +' AND '+
                     '      PUBLICADA = 1')
  Then Begin
    Result := True;
  End;
end;

{==============================================================================}
{ Retorna se Regra da Formula é publicada ou não                               }
function TfrmImportarRegras.FormulaPublicada(IdFormula: String): Boolean;
begin
  Result := False;
  If FazQuery(QryAux,'SELECT R.IDREGRA FROM REGRA R, ALGREGRA AR  '+
                     'WHERE AR.IDCAMPO2 = '+ QuotedStr(IdFormula) + ' AND '+
                     '      R.PUBLICADA = 1 AND R.IDREGRA = AR.IDREGRA ')
  Then Begin
    Result := True;
  End;
end;

procedure TfrmImportarRegras.ImportaRegrasNomes(IDRegra, IDRegraOLD, sRegraOper : String);
  Var
  vVar1, vVar2, vVar3, vVar4, vVar5, vVar6, vVar7,
  vVar8, vSql, vId, vAux, sObrigatorio, sIdCampo, sTipoDado, sIdGrupo,
  sDscGrupo : String;
  TemGrupo:Boolean;
  R, vSeqNew, vSeqOld, Maximo : LongInt;
  QryAuxNome : TwwQuery;
begin
  try
    While TabRegra.Locate('OLDIDREGRA', IDRegraOLD,[]) do begin

      frmAguarde.Mostra('Importando Regras');
      frmAguarde.Refresh;
      rchedt.Lines.Add('REGRAS');
      frmAguarde.Pos := 1;
      frmAguarde.Min := 0;
      frmAguarde.Max := TabRegra.RecordCount;
      TabRegra.First;

      vId  := TabRegra.FieldbyName('IDTIPOREGRA').AsString;
      vAux := TabRegra.FieldbyName('NOMEREGRA').AsString;
      vSeqOld := TabRegra.FieldbyName('IDREGRA').AsInteger;
      //INICIO André Oliveira SOL 169547/8741 KINTANA 1619963
      { Verifica se a Regra já existe no Banco }
      {With QryWrk do begin
        Close;
        SQL.Clear;
        vSql := 'SELECT IDREGRA, NOMEREGRA, IDREGRA  FROM REGRA '+
                'WHERE RTRIM(NOMEREGRA) ='''+Trim(vAux)+''' AND IDTIPOREGRA='+vId;
        SQL.Add(vSql);
        Open;
      End;  }

      { Caso não exista, insere }
      //If QryWrk.IsEmpty then begin
      QryAuxNome := TwwQuery.Create(Application);
      QryAuxNome.DatabaseName  := QryWrk.DatabaseName;
      If sRegraOper = 'I'  then begin
      // Fim Andre Oliveira SOL 169547/8741 KINTANA 1619963

        vSeqNew := LeUltRegistro(NIL,'REGRA');
        With QryAuxNome do begin
          Close;
          SQL.Clear;
          { Monta SQL de Inserção da nova Regra }
          vSql := 'INSERT INTO REGRA (IDREGRA, IDTIPOREGRA, NOMEREGRA, DESCRICAOREGRA, PUBLICADA'+
                  ') VALUES ('+
                       IntToStr(vSeqNew)+','+
                       TabRegra.FieldbyName('IDTIPOREGRA').AsString+','+
                  ''''+Copy(Trim(TabRegra.FieldbyName('NOMEREGRA').AsString),1,60)+''','+
                  ''''+TabRegra.FieldbyName('DESCRICAOREGRA').AsString+''','+
                  ''''+'0'+''')';

          SQL.Add(vSql);

          Try
            ExecSQL;
            rchedt.Lines.Add('Regra nº '+IntToStr(vSeqNew)+' / '+
                             TabRegra.FieldbyName('NOMEREGRA').AsString+
                             ', importada com sucessso.');
          Except
            on e:exception do begin
              rchedt.Lines.Add( ' Regra nº '+InttoStr(vSeqNew)+'/'+TabRegra.FieldbyName('NOMEREGRA').AsString+' não importado. Erro de Inserção.');
              rchedt.Lines.Add( '     IDREGRA        :'+TabRegra.FieldbyName('IDREGRA').AsString);
              rchedt.Lines.Add( '     IDTIPOREGRA    :'+TabRegra.FieldbyName('IDTIPOREGRA').AsString);
              rchedt.Lines.Add( '     NOMEREGRA      :'+TabRegra.FieldbyName('NOMEREGRA').AsString);
              rchedt.Lines.Add( '     DESCRICAOREGRA :'+TabRegra.FieldbyName('DESCRICAOREGRA').AsString);
              rchedt.Lines.Add( '     PUBLICADA      :0' );
              rchedt.Lines.Add( ' COMANDO DE ENTRADA : ' );
              rchedt.Lines.Add( '   '+vSql );
              rchedt.Lines.Add('');
              rchedt.Lines.Add('MENSAGEM .: '+e.Message);
            end;
          End;
        End;
      //End Else Begin
      End Else if(sRegraOper = 'U') then Begin  //Andre Oliveira SOL 169547/8741 KINTANA 1619963
      { Caso Rera já exista no Banco, Atualiza }

        vSeqNew := StrToInt(IDREGRA);

        //If RegraPublicada(TabRegra.FieldbyName('OLDIDREGRA').AsString)  Then Begin
        If RegraPublicada(IntToStr(vSeqNew))  Then Begin      //Andre Oliveira SOL 169547/8741 KINTANA 1619963

          MsgDlg('Regra cadastrada está publicada e não é permitida a alteração!','Atenção',mtWarning,[mbOk],0);//Andre Oliveira SOL 169547/8741 KINTANA 1619963
          rchedt.Lines.Add('REGRA '+IDREGRA+' / "'+
                                    Copy(TabRegra.FieldbyName('NOMEREGRA').AsString,1,30)+
                                    '" PUBLICADA, NAO FOI IMPORTADA! '+#13+
                                    '      CLIQUE EM "NOVA REGRA" PARA IMPORTAR COM OUTRO NOME');
          TabRegra.Next;
          //Continue;
        End;


        { Altera a Regra importada e os Algoritmos para o Identificado da Regra do Banco }
        TabRegra.Edit;
        TabRegra.FieldbyName('IDREGRA').AsInteger := vSeqnew;
        TabRegra.Post;

        Maximo := 0;
        While TabAlgRegra.Locate('IDREGRA', InttoStr(vSeqnew), []) do begin
          TabAlgRegra.Edit;
          TabAlgRegra.FieldbyName('IDREGRA').AsInteger := vSeqnew;
          TabAlgRegra.Post;
          if Maximo > TabAlgRegra.RecordCount then
            Break;
          inc(Maximo);
        End;

        { Altera Passos que chamam esta Regra }
        Maximo := 0;
        while TabAlgRegra.Locate('TIPOALGORITMO;IDCAMPO2', VarArrayOf(['14',InttoStr(vSeqnew)]), []) do begin
          TabAlgRegra.Edit;
          TabAlgRegra.FieldbyName('IDCAMPO2').AsString := InttoStr(vSeqnew);
          TabAlgRegra.Post;
          if Maximo > TabAlgRegra.RecordCount then
            Break;
          inc(Maximo);
        end;

        { Atualiza Registro da Regra }
        with QryAuxNome do begin
          Close;
          SQL.Clear;
          vSQL := 'UPDATE REGRA '+
                  'SET '+
                  'IDTIPOREGRA = '+TabRegra.fieldbyname('IDTIPOREGRA').AsString+', '+
                  'NOMEREGRA = '''+Copy(Trim(TabRegra.FieldbyName('NOMEREGRA').AsString),1,60)+''', '+
                  'DESCRICAOREGRA = '''+TabRegra.FieldbyName('DESCRICAOREGRA').AsString+''', '+
                  'PUBLICADA = '+TabRegra.FieldbyName('PUBLICADA').AsString+' '+
                  'WHERE IDREGRA = '+InttoStr(vSeqNew);
          SQL.Add(vSql);
          Try
            ExecSQL;
          Except
            rchedt.Lines.Add( ' Regra nº '+InttoStr(vSeqNew)+' - '+TabRegra.FieldbyName('NOMEREGRA').AsString+
                              ' não Atualizado. Erro de UpDate.');
            rchedt.Lines.Add( '     IDREGRA '+TabRegra.FieldbyName('IDREGRA').AsString);
            rchedt.Lines.Add( '     IDTIPOREGRA '+TabRegra.FieldbyName('IDTIPOREGRA').AsString);
            rchedt.Lines.Add( '     NOMEREGRA '+TabRegra.FieldbyName('NOMEREGRA').AsString);
            rchedt.Lines.Add( '     DESCRICAOREGRA '+TabRegra.FieldbyName('DESCRICAOREGRA').AsString);
            rchedt.Lines.Add( '     PUBLICADA '+TabRegra.FieldbyName('PUBLICADA').AsString);
            rchedt.Lines.Add( ' COMANDO DE ENTRADA : '+vSql );
            rchedt.Lines.Add('');
          End;
        End;
      End;
      TabRegra.Next;
      frmAguarde.Pos := frmAguarde.Pos + 1;
      Break;
    end;

    { Copiando ALGREGRA }
     frmAguarde.Mostra('Importando Passos das Regras');
     frmAguarde.Refresh;
     rchedt.Lines.Add('PASSOS DAS REGRAS');
     frmAguarde.Pos := 1;
     frmAguarde.Min := 0;
     frmAguarde.Max := TabAlgRegra.RecordCount;
     TabAlgRegra.First;
    { Varre os algoritmos da Regra a ser importada e insere os que não existem }
    while not TabAlgRegra.Eof do begin
      if TabAlgRegra.FieldbyName('OLDIDREGRA').AsString = IDRegraOLD then begin
        { Verifica se regra é publicada }
        If RegraPublicada( IntToStr( vSeqNew ) ) Then Begin
          TabAlgRegra.Next;
          Continue;
        End;

        { Verifica se a Regra já existe }
        with QryAuxNome do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT IDREGRA, IDALGORITMODAREG FROM ALGREGRA WHERE ');
          SQL.Add('IDREGRA = '+IntToStr(vSeqNew));
          SQL.Add(' AND IDALGORITMODAREG = '+TabAlgRegra.FieldbyName('IDALGORITMODAREG').AsString);
          Open;
        end;
        vVar1 := '';
        vVar2 := '';
        vVar3 := '';
        vVar4 := '';
        vVar5 := '';
        vVar6 := '';
        vVar7 := '';
        vVar8 := '';

        { Prepara Variaveis }
        try
          if InttoStr(TabAlgRegra.FieldbyName('FORMULA2').AsInteger) <> '0' then
            vVar1 := TabAlgRegra.FieldbyName('FORMULA2').AsString;
        except
          vVar1 := 'NULL';
        end;
        if vVar1 = '' then
          vVar1 := 'NULL';

        try
          if InttoStr(TabAlgRegra.FieldbyName('TIPOALGORITMO').AsInteger) <> '0' then
            vVar2 := TabAlgRegra.FieldbyName('TIPOALGORITMO').AsString;
        except
          vVar2 := '''''';
        end;

        try
          if InttoStr(TabAlgRegra.FieldbyName('ALGORSUBSEQTRUE').AsInteger) <> '0' then
            vVar3 := TabAlgRegra.FieldbyName('ALGORSUBSEQTRUE').AsString;
        except
          vVar3 := 'NULL';
        end;

        if vVar3 = '' then
          vVar3 := 'NULL';

        try
          if InttoStr(TabAlgRegra.FieldbyName('FORMULA1').AsInteger) <> '0' then
            vVar4 := TabAlgRegra.FieldbyName('FORMULA1').AsString;
        except
          vVar4 := 'NULL';
        end;

        if vVar4 = '' then
          vVar4 := 'NULL';

        try
          if InttoStr(TabAlgRegra.FieldbyName('ALGORSUBSEQFALSE').AsInteger) <> '0' then
            vVar5 := TabAlgRegra.FieldbyName('ALGORSUBSEQFALSE').AsString;
        except
          vVar5 := 'NULL';
        end;

        if vVar5 = '' then
          vVar5 := 'NULL';

        If Trim(TabAlgRegra.FieldbyName('IDCAMPO').AsString) = '' Then
          sIdCampo := 'NULL'
        Else
          sIdCampo := QuotedStr(TabAlgRegra.FieldbyName('IDCAMPO').AsString);

        vVar6 := TabAlgRegra.FieldbyName('TIPOCAMPO1').AsString;
        vVar7 := TabAlgRegra.FieldbyName('TIPOCAMPO2').AsString;

        try
          if InttoStr(TabAlgRegra.FieldbyName('FORMATACAO').AsInteger) <> '0' then
            vVar8 := TabAlgRegra.FieldbyName('FORMATACAO').AsString;
        except
          vVar8 := 'NULL';
        end;

        if vVar8 = '' then
          vVar8 := 'NULL';

        { Caso não tenha encontrado algoritmo, insere }
        if QryAuxNome.IsEmpty then begin
          with QryAuxNome do begin
            Close;
            SQL.Clear;
            vSql :=   'INSERT INTO ALGREGRA (IDREGRA, IDALGORITMODAREG, IDCAMPO, FORMULA1, CORRELACAO, '+
                      'FORMULA2, IDCAMPO2, VALOR, TIPOALGORITMO, DESCRICAOALGORIT, ALGORSUBSEQTRUE, '+
                      'ALGORSUBSEQFALSE, TIPOCAMPO1, TIPOCAMPO2, FORMATACAO) VALUES ('+
                           IntToStr(vSeqNew)+','+
                           TabAlgRegra.FieldbyName('IDALGORITMODAREG').AsString+','+
                           sIdCampo+','+
                      vVar4+','+
                      ''''+TabAlgRegra.FieldbyName('CORRELACAO').AsString+''','+
                      vVar1+','+
                      ''''+TabAlgRegra.FieldbyName('IDCAMPO2').AsString+''','+
                      ''''+TabAlgRegra.FieldbyName('VALOR').AsString+''','+
                      vVar2+','+
                      ''''+TabAlgRegra.FieldbyName('DESCRICAOALGORIT').AsString+''','+
                      vVar3+','+
                      VVar5+','+
                      vVar6+','+
                      vVar7+','+
                      vVar8+')';
            SQL.Add(vSql);
            try
              ExecSQL;
            except
              on e:exception do begin
                rchedt.Lines.Add( ' Regra Nº '+IntToStr(vSeqNew)+
                                  ' Passo '+TabAlgRegra.FieldbyName('IDALGORITMODAREG').AsString+'. Erro de Inserção.');
                rchedt.Lines.Add('      IDREGRA : '+TabAlgRegra.FieldbyName('IDREGRA').AsString);
                rchedt.Lines.Add('      IDALGORITMODAREG : '+TabAlgRegra.FieldbyName('IDALGORITMODAREG').AsString);
                rchedt.Lines.Add('      IDCAMPO : '+TabAlgRegra.FieldbyName('IDCAMPO').AsString);
                rchedt.Lines.Add('      FORMULA1 : '+TabAlgRegra.FieldbyName('FORMULA1').AsString);
                rchedt.Lines.Add('      CORRELACAO : '+TabAlgRegra.FieldbyName('CORRELACAO').AsString);
                rchedt.Lines.Add('      FORMULA2 : '+TabAlgRegra.FieldbyName('FORMULA2').AsString);
                rchedt.Lines.Add('      IDCAMPO2 : '+TabAlgRegra.FieldbyName('IDCAMPO2').AsString);
                rchedt.Lines.Add('      VALOR : '+TabAlgRegra.FieldbyName('VALOR').AsString);
                rchedt.Lines.Add('      TIPOALGORITMO : '+TabAlgRegra.FieldbyName('TIPOALGORITMO').AsString);
                rchedt.Lines.Add('      DESCRICAOALGORIT : '+TabAlgRegra.FieldbyName('DESCRICAOALGORIT').AsString);
                rchedt.Lines.Add('      ALGORSUBSEQTRUE : '+TabAlgRegra.FieldbyName('ALGORSUBSEQTRUE').AsString);
                rchedt.Lines.Add('      ALGORSUBSEQFALSE : '+TabAlgRegra.FieldbyName('ALGORSUBSEQFALSE').AsString);
                rchedt.Lines.Add('      TIPOCAMPO1 : '+TabAlgRegra.FieldbyName('TIPOCAMPO1').AsString);
                rchedt.Lines.Add('      TIPOCAMPO2 : '+TabAlgRegra.FieldbyName('TIPOCAMPO2').AsString);
                rchedt.Lines.Add('      FORMATACAO : '+TabAlgRegra.FieldbyName('FORMATACAO').AsString);
                rchedt.Lines.Add(' COMANDO DE ENTRADA : '+vSql );
                rchedt.Lines.Add('');
                rchedt.Lines.Add('MENSAGEM .: '+e.Message);
              end;

            end;
          end;
        end else begin
        { Caso exista o algoritmo, Atualiza }
          with QryAuxNome do begin
            Close;
            SQL.Clear;
        
            vSql :=   'UPDATE ALGREGRA SET '+
                      'IDALGORITMODAREG = '+TabAlgRegra.FieldbyName('IDALGORITMODAREG').AsString+','+
                      'IDCAMPO = '+sIdCampo+','+
                      'FORMULA1 = '+vVar4+','+
                      'CORRELACAO = '''+TabAlgRegra.FieldbyName('CORRELACAO').AsString+''','+
                      'FORMULA2 = '+vVar1+','+
                      'IDCAMPO2 = '''+TabAlgRegra.FieldbyName('IDCAMPO2').AsString+''','+
                      'VALOR = '''+TabAlgRegra.FieldbyName('VALOR').AsString+''','+
                      'TIPOALGORITMO = '+vVar2+','+
                      'DESCRICAOALGORIT = '''+TabAlgRegra.FieldbyName('DESCRICAOALGORIT').AsString+''','+
                      'ALGORSUBSEQTRUE = '+vVar3+','+
                      'ALGORSUBSEQFALSE = '+VVar5+','+
                      'TIPOCAMPO1 = '+vVar6+','+
                      'TIPOCAMPO2 = '+vVar7+','+
                      'FORMATACAO = '+vVar8+' WHERE IDREGRA = '+IntToStr(vSeqNew)+' AND '+
                      'IDALGORITMODAREG = '+TabAlgRegra.FieldbyName('IDALGORITMODAREG').AsString;
            SQL.Add(vSql);
            try
              ExecSQL;
            except
              rchedt.Lines.Add( ' Regra Nº '+IntToStr(vSeqNew)+
                                ' Passo '+TabAlgRegra.FieldbyName('IDALGORITMODAREG').AsString+'. Erro de Atualização.');
              rchedt.Lines.Add('      IDREGRA : '+TabAlgRegra.FieldbyName('IDREGRA').AsString);
              rchedt.Lines.Add('      IDALGORITMODAREG : '+TabAlgRegra.FieldbyName('IDALGORITMODAREG').AsString);
              rchedt.Lines.Add('      IDCAMPO : '+TabAlgRegra.FieldbyName('IDCAMPO').AsString);
              rchedt.Lines.Add('      FORMULA1 : '+TabAlgRegra.FieldbyName('FORMULA1').AsString);
              rchedt.Lines.Add('      CORRELACAO : '+TabAlgRegra.FieldbyName('CORRELACAO').AsString);
              rchedt.Lines.Add('      FORMULA2 : '+TabAlgRegra.FieldbyName('FORMULA2').AsString);
              rchedt.Lines.Add('      IDCAMPO2 : '+TabAlgRegra.FieldbyName('IDCAMPO2').AsString);
              rchedt.Lines.Add('      VALOR : '+TabAlgRegra.FieldbyName('VALOR').AsString);
              rchedt.Lines.Add('      TIPOALGORITMO : '+TabAlgRegra.FieldbyName('TIPOALGORITMO').AsString);
              rchedt.Lines.Add('      DESCRICAOALGORIT : '+TabAlgRegra.FieldbyName('DESCRICAOALGORIT').AsString);
              rchedt.Lines.Add('      ALGORSUBSEQTRUE : '+TabAlgRegra.FieldbyName('ALGORSUBSEQTRUE').AsString);
              rchedt.Lines.Add('      ALGORSUBSEQFALSE : '+TabAlgRegra.FieldbyName('ALGORSUBSEQFALSE').AsString);
              rchedt.Lines.Add('      TIPOCAMPO1 : '+TabAlgRegra.FieldbyName('TIPOCAMPO1').AsString);
              rchedt.Lines.Add('      TIPOCAMPO2 : '+TabAlgRegra.FieldbyName('TIPOCAMPO2').AsString);
              rchedt.Lines.Add('      FORMATACAO : '+TabAlgRegra.FieldbyName('FORMATACAO').AsString);
              rchedt.Lines.Add( ' COMANDO DE ENTRADA : '+vSql );
              rchedt.Lines.Add('');
            end;
          end;
        end;

      End;
       TabAlgRegra.Next;
       frmAguarde.Pos := frmAguarde.Pos + 1;
    end;

  finally
    QryAuxNome.Free;
  end;
end;

procedure TfrmImportarRegras.Split(const Delimiter: Char; Input: string;
  const Strings: TStringList);
var
  I : integer;
begin
     Assert(Assigned(Strings)) ;
     Strings.Clear;
     I := Pos(Delimiter, Input);
     If I <= 0 Then I := (Length(Input)+1);
     Strings.add(Copy(Input,1,(I-1)));
     Input := Copy(Input, I + 1, Length(Input));

     I := Pos(Delimiter, Input);
     If I <= 0 Then I := (Length(Input)+1);
     Strings.add(Copy(Input,1,(I-1)));
     Input := Copy(Input, I + 1, Length(Input));

     I := Pos(Delimiter, Input);
     If I <= 0 Then I := (Length(Input)+1);
     Strings.add(Copy(Input,1,(I-1)));
     //Input := Copy(Input, I + 1, Length(Input));
end;





end.

