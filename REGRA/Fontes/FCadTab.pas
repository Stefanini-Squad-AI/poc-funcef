//******************************************************************************
// Alterações:
//------------------------------------------------------------------------------
// Autor(a)    :  BRUNO AZEVEDO.
// Data        :  20/04/2012
// Pendência   :  SOL 178775 KINTANA 1642943
// Descrição   :  Ajuste no Scroll da grid.
//------------------------------------------------------------------------------
// Autor(a)    :  Douglas de Siqueira.
// Data        :  22/03/2012
// Pendência   :  SOL 161282 KINTANA 1358379
// Descrição   :  Implementar botão para inserir linhas abaixo da  linha selecionada.
//------------------------------------------------------------------------------
// Autor(a)    :  Jéssica Lana
// Data        :  27/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descrição   :  Alteração de gravação de arquivos de log na raiz do disco C:
// *****************************************************************************
// Alexandre Ramos / Pendencia 21373 - 07/02/2006
// Atualizar novos campos da tabela TABGENER
//------------------------------------------------------------------------------
// 14/02/03 - Alexandre Ramos
// Opção para exportar tabelas com colunas de tamanho Fixo.
//------------------------------------------------------------------------------
// 08/11/00 - Alexandre Ramos
//   1) Valores agora só podem ser cadastrados em Maiusculo.
//   2) Acertos no LayOut. 
//******************************************************************************
unit FCadTab;                   

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDet, Db, DBTables, Wwquery, wwdblook, StdCtrls, Mask, wwdbedit,
  cmseldlg, wwidlg, Wwdatsrc, DBCtrls, MAHlpBtn, ComCtrls,
  ToolWin, Buttons, Grids, Wwdbigrd, Wwdbgrid, TB97,
  DBGrids, URegra, TB97Ctls, TB97Tlbr, MontaSelect, IvDictio, IvMulti,
  IvEMulti, wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro,
  wwDialog, ImgList, ExtCtrls, uSistema;

type
  Str20 = string[20];

type
  TfrmCadTabela = class(TfrmCadMestreDetalhe)
    Label1: TLabel;
    dbedDescricao: TwwDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dblkcmbTipo: TwwDBLookupCombo;
    dbedDescCampo: TwwDBEdit;
    qryPrinc: TwwQuery;
    qryAux: TwwQuery;
    qrySelect: TwwQuery;
    qryTpDado: TwwQuery;
    dsSelect: TwwDataSource;
    dsTpDad: TwwDataSource;
    TabSheet1: TTabSheet;
    pnlControlesDet2: TPanel;
    Label5: TLabel;
    Panel2: TPanel;
    bbtnOkDet2: TBitBtn;
    bbtnCancelarDet2: TBitBtn;
    dbedDescLinha: TwwDBEdit;
    pnlBarraDetalhe2: TPanel;
    sbtnProcDet2: TSpeedButton;
    sbtnApagLinha: TSpeedButton;
    sbtnAltLinha: TSpeedButton;
    sbtnInsLinha: TSpeedButton;
    dsDet2: TwwDataSource;
    dsAux: TwwDataSource;
    Label4: TLabel;
    edColUtilizada: TEdit;
    qryLinhas: TwwQuery;
    pnLinhas: TPanel;
    Label6: TLabel;
    btnLinhas: TBitBtn;
    btnSairLinha: TBitBtn;
    GrdDet2: TStringGrid;
    dtedVlLinha: TCMDateTimePicker;
    Label7: TLabel;
    wwdbeNome: TwwDBEdit;
    Label8: TLabel;
    wwDBECodCampo: TwwDBEdit;
    qryDet: TwwQuery;
    qryDet2: TwwQuery;
    edValor: TEdit;
    SgrdDet: TStringGrid;
    StrGrdTab: TStringGrid;
    qryPrincCODTABELA: TStringField;
    qryPrincDESCRICAO: TStringField;
    BtExcluiLinha: TSpeedButton;
    BtInsereLinha: TSpeedButton;
    QryRegras: TwwQuery;
    QueryIn: TwwQuery;
    QryAux2: TwwQuery;
    MontaSelect1: TMontaSelect;
    BitBtnExportar: TBitBtn;
    Sd: TSaveDialog;
    QryValores: TwwQuery;
    UpdPrinc: TUpdateSQL;
    QryPermissao: TwwQuery;
    qryPrincFLGEXCLUIR: TFloatField;
    qryPrincFLGALTERAR: TFloatField;
    qryPrincFLGPROCURAR: TFloatField;
    qryPrincIDMODULO: TFloatField;
    qryPrincIDPESSOA: TFloatField;
    btnBtInsereLinhaB: TSpeedButton;//  SOL 161282 KINTANA 1358379 Douglas.siqueira.
    function VerificaMestre  : boolean;
    function VerificaDetalhe : boolean;
    function PostDetalhe : boolean ;
    function PostMestre  : boolean ;
    function PostDetalhe2 : boolean;
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnOkDet2Click(Sender: TObject);
    procedure bbtnCancelarDet2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnInsLinhaClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnApagDetClick(Sender: TObject);
    procedure sbtnAltLinhaClick(Sender: TObject);
    procedure sbtnApagLinhaClick(Sender: TObject);
    procedure pgctrlDetalheChanging(Sender: TObject;
    var AllowChange: Boolean);
    procedure sbtnApagarClick(Sender: TObject);
    procedure btnLinhasClick(Sender: TObject);
    procedure btnSairLinhaClick(Sender: TObject);
    procedure dbedDescLinhaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qryDetAfterInsert(DataSet: TDataSet);
    procedure qryDetAfterScroll(DataSet: TDataSet);
    procedure qryDetBeforeDelete(DataSet: TDataSet);
    procedure qryDetBeforeEdit(DataSet: TDataSet);
    procedure qryDetBeforeInsert(DataSet: TDataSet);
    procedure qryDet2AfterInsert(DataSet: TDataSet);
    procedure qryDet2AfterScroll(DataSet: TDataSet);
    procedure qryDet2Valor_formatChange(Sender: TField);
    procedure pgctrlDetalheChange(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure StrGrdTabKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure incluicoluna;
    procedure Button1Click(Sender: TObject);
    procedure limpagrid;
    procedure BtExcluiLinhaClick(Sender: TObject);
    procedure BtInsereLinhaClick(Sender: TObject);
    procedure StrGrdTabSelectCell(Sender: TObject; Col, Row: Integer;
      var CanSelect: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure BitBtnExportarClick(Sender: TObject);
    procedure StrGrdTabKeyPress(Sender: TObject; var Key: Char);
    function TrataCelulas : Boolean;
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure btnBtInsereLinhaBClick(Sender: TObject);//  SOL 161282 KINTANA 1358379 Douglas.siqueira.
  private
    { Private declarations }
    procedure VerificaTipoDado;
    function  CarregaQueryLinhas:Boolean;
    function  CarregaQuerydet2:Boolean;
    function  ValNumero(Numero:str20):str20;
    function  BuscaNomeColuna(aCodTabela,aCodCampo:String) : string;
    function  TrocaPontoVirgula(Value: String): String;
    function  TrocaVirgulaPonto(Value: String): String;
    Procedure IncluiAutorizacao(sCodTabela : String);
    Procedure ExcluiAutorizacao(sCodTabela : String);

    Function  BuscaTamanhoColuna(sTabela, sColuna : String): Integer;
    Function  AbrePermissao( Tipo : LongInt) : Boolean;
  public
    { Public declarations }
    bkmkFilho2 : TBookMark;
  end;

var
  frmCadTabela: TfrmCadTabela;
  nomecampo:string[15];
  opcdet:char;

implementation

uses UDataBase, UMensErro, DBaseDados, fAguarde, uBiblioteca;

{$R *.DFM}

procedure TfrmCadTabela.FormShow(Sender: TObject);
var
  i:integer;
begin
//  inherited;

  qryDet.Open;
  qryDet2.Close;
  qryDet2.Open;
  qryTpDado.Open;

  carregaquerydet2;
  pnlControlesDet2.SendToBack;

  pnLinhas.Top     := 23;
  pnLinhas.Left    := 3;
  pnLinhas.Visible := False;

  dtedVlLinha.Visible   := False;
  dbedDescLinha.Visible := False;

  pgctrlDetalhe.activepage := tbshDetalhe;
  dbgrdDet.applyselected;

  TabSheet1.enabled     := true;
  tbshDetalhe.enabled   := true;

  //BRUNO AZEVEDO SOL 178775 KINTANA 1642943
  pnlFundo.enabled := True;
  sbtnInsDet.Enabled := False;
  sbtnAltDet.Enabled := False;
  sbtnApagDet.Enabled := False;
  BtExcluiLinha.Enabled := False;
  BtInsereLinha.Enabled := False;
  btnBtInsereLinhaB.Enabled := False;
  StrGrdTab.Options := StrGrdTab.Options - [goEditing];

  for i:=0 to StrGrdTab.Colcount-1 do
      StrGrdTab.ColWidths[i]:=120;
end;

procedure TfrmCadTabela.bbtnConfirmarClick(Sender: TObject);
var
  x,y:integer;
begin
  sbtnAltDet.Enabled := True;
  sbtnApagDet.Enabled := True;
  dbgrdDet.Visible := False;
  pnlControlesDet2.Visible := False;

  if not VerificaMestre then begin
     MsgDlg('É preciso incluir o nome da tabela.','Atenção',mterror,[mbOk],0);
     exit;
  end;
  qryaux.Close;
  qryaux.SQL.clear;
  qryaux.sql.add('DELETE FROM VALTABGENER WHERE CODTABELA='''+
                  qryprinc.fieldbyname('CODTABELA').asstring+'''');
  qryaux.execsql;

  for x:=1 to strgrdtab.colcount-1 do
      for y:=1 to strgrdtab.RowCount-1 do begin
          if strgrdtab.cells[x,y]<> '' then begin
             qrydet2.Insert;
             qrydet2.FieldByName('CODTABELA').asstring:=qryprinc.fieldbyname('CODTABELA').asstring;
             qrydet2.FieldByName('NUMLINHA').asfloat  :=y;
             qrydet2.FieldByName('CODCAMPO').asstring :=strgrdtab.cells[x,0];
             qrydet2.FieldByName('VALOR').asstring    :=trocavirgulaponto(strgrdtab.cells[x,y]);
             qrydet2.Post;
          end;
      end;

  qryDet2.Close;
  qryDet2.Open;
  if qryDet2.recordCount = 0 then begin
     MsgDlg('É preciso incluir linha(s) para a(s) coluna(s).','Atenção',mterror,[mbOk],0);
     Exit;
  end;

  pgctrlDetalhe.ActivePage:=tbshDetalhe;

  { Grava Log da operação}
  If Not Sistema.GravaLogOperacoes('Manutenção do Cadastro de Tabelas Genéricas') Then
    Raise Exception.Create('Não Consegui Gravar o Log');

  inherited;
  dbgrdDet.Visible := False;
  pnlControlesDet2.Visible := False;
  dbgrdDet.applyselected;

  qryprinc.Close;
  qryprinc.ParamByName('IDUSUARIO').AsInteger := Sistema.IdUsuario;
  qryprinc.Open;

  qrydet.open;
  pnlFundo.Enabled := False;

  //BRUNO AZEVEDO SOL 178775 KINTANA 1642943
  pnlFundo.enabled := True;
  sbtnInsDet.Enabled := False;
  sbtnAltDet.Enabled := False;
  sbtnApagDet.Enabled := False;
  BtExcluiLinha.Enabled := False;
  BtInsereLinha.Enabled := False;
  btnBtInsereLinhaB.Enabled := False;
  StrGrdTab.Options := StrGrdTab.Options - [goEditing];
end;

procedure TfrmCadTabela.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  
  sbtnAltDet.Enabled  := True;
  sbtnApagDet.Enabled := True;
  pnlFundo.Enabled    := False;


  //BRUNO AZEVEDO SOL 178775 KINTANA 1642943
  pnlFundo.enabled := True;
  sbtnInsDet.Enabled := False;
  sbtnAltDet.Enabled := False;
  sbtnApagDet.Enabled := False;
  BtExcluiLinha.Enabled := False;
  BtInsereLinha.Enabled := False;
  btnBtInsereLinhaB.Enabled := False;
  StrGrdTab.Options := StrGrdTab.Options - [goEditing];
end;

procedure TfrmCadTabela.sbtnInserirClick(Sender: TObject);
begin
  pnlFundo.Enabled := True;
  inherited;
  pgctrlDetalhe.activepage := tbshDetalhe;
  limpagrid;
  sbtnAltDet.Enabled  := False;
  sbtnApagDet.Enabled := False;

  //BRUNO AZEVEDO SOL 178775 KINTANA 1642943
  pnlFundo.enabled := True;
  sbtnInsDet.Enabled := True;
  BtExcluiLinha.Enabled := True;
  BtInsereLinha.Enabled := True;
  btnBtInsereLinhaB.Enabled := True;
  StrGrdTab.Options := StrGrdTab.Options + [goEditing];
end;

procedure TfrmCadTabela.sbtnApagarClick(Sender: TObject);
begin                                                           
  if (QryPrinc.FieldByName('FLGEXCLUIR').AsInteger = 0) then begin
     MsgDlg('O usuário ('+Sistema.NomeUsuario+') não está autorizado a Excluit esta Tabela Genérica .',
            'Erro',mtError,[mbOk,mbHelp],0);
     sbtnApagar.Down := False;
     Exit;
  end;

  if MsgDlg('Deseja realmente excluir esta Tabela ?','Atenção',mtConfirmation,[mbyes,mbno],0) = mrNo then
     Exit;

  with qryAux do begin
       Close;
       try
          Sql.Clear;
          Sql.Add('DELETE FROM REGRATABGENER   ');
          Sql.Add('WHERE  CODTABELA = '''+qryprinc.fieldbyname('codtabela').asstring+'''');
          ExecSql;
          Sql.Clear;
          Sql.Add('DELETE FROM VALTABGENER   ');
          Sql.Add('WHERE  CODTABELA = '''+qryprinc.fieldbyname('codtabela').asstring+'''');
          ExecSql;
          Sql.Clear;
          Sql.Add('DELETE FROM CAMPOTABGENER ');
          Sql.Add('WHERE  CODTABELA = '''+qryprinc.fieldbyname('codtabela').asstring+'''');
          ExecSql;
          Sql.Clear;
          Sql.Add('DELETE       ');
          Sql.Add('FROM   TABGENER        ');
          Sql.Add('WHERE  CODTABELA = '''+qryprinc.fieldbyname('codtabela').asstring+'''');
          execsql;
          Sql.Clear;
          Sql.Add('commit');
          execsql;
       except
             raise;
       end;
       qrydet2.close;
       qrydet.close;
       qryprinc.Close;
       qryprinc.ParamByName('IDUSUARIO').AsInteger := Sistema.IdUsuario;
       qryprinc.Open;
       qrydet.open;
       qrydet2.open;
       sbtnapagar.down:=false;
  end;
end;

procedure TfrmCadTabela.bbtnOkDetClick(Sender: TObject);
Var
  sSQL : String;
begin
  if not VerificaMestre then begin
     MsgDlg('É preciso incluir o nome da tabela.','Atenção',mterror,[mbOk],0);
     exit;
  end;
  if dbedDescCampo.Text = '' then begin
     MsgDlg('É preciso preencher o nome da coluna.','Atenção',mterror,[mbOk],0);
     exit;
  end;
  if dblkcmbTipo.Text = '' then begin
     MsgDlg('É preciso preencher o tipo de dado.','Atenção',mterror,[mbOk],0);
     exit;
  end;

  nomecampo:=wwDBECodCampo.text;
  if opcdet='I' then begin
     incluicoluna;
     inherited;
     bbtnCancelarDetclick(sender);
  end else begin
       qryaux.close;
       qryaux.sql.clear;
       qryaux.sql.Add('DELETE FROM VALTABGENER WHERE CODTABELA ='''+
                      qryprinc.fieldbyname('CODTABELA').asstring+
                      ''' AND CODCAMPO='''+ strgrdtab.Cells[strgrdtab.col,0]+ '''');
       qryaux.execsql;

       strgrdtab.cells[strgrdtab.col,0]:=Nomecampo;
       QryDet.Post;
  end;

  dbgrdDet.applyselected;
  pnlcontrolesdet.sendtoback;

  sbtnInsDet.Down := False;
  sbtnAltDet.Down := False;
  sbtnApagDet.Down:= False;
end;

procedure TfrmCadTabela.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  dbgrdDet.applyselected;
  sbtnInsDet.Down := False;
  sbtnAltDet.Down := False;
  sbtnApagDet.Down:= False;
end;

procedure TfrmCadTabela.sbtnInsDetClick(Sender: TObject);
begin
  { Testa Dados do Mestre }
  If (Trim(wwdbeNome.Text) = '') Or (Trim(dbedDescricao.Text) = '') Then Begin
    MsgDlg('Preencha os dados da Tabela!','Atenção',mterror,[mbOk],0);
    wwDbeNome.SetFocus;
    sbtnInsDet.Down := False;
    Exit;
  End;

  pnlcontrolesdet.BringToFront;
  inherited;
  opcdet:='I';
end;

procedure TfrmCadTabela.sbtnAltDetClick(Sender: TObject);
Var
  bAchou : Boolean;
Begin
  bAchou := False;
  qrydet.first;
  while not qrydet.eof do begin
    if Qrydet.FieldByName('codcampo').asstring = strgrdtab.Cells[strgrdtab.col,0] then begin
      bAchou := True;
      break;
    end;
    QryDet.next;
  end;
  { Caso não tenha encontrado }
  If bAchou = False Then Begin
    MsgDlg('Selecione a Coluna a ser alterada! ',  'Erro',mtError,[MbOk],0);
    sbtnAltDet.Down := False;
    Exit;
  End;
  
  pnlcontrolesdet.BringToFront;
  inherited;
  opcdet:='A';
end;

procedure TfrmCadTabela.sbtnApagDetClick(Sender: TObject);
var
   x, y : LongInt;
begin
  if MsgDlg('Deseja realmente excluir esta coluna?','Atenção',mtConfirmation,[mbyes,mbno,mbHelp],0)=mryes then begin
     qryaux.close;
     qryaux.sql.clear;
     qryaux.sql.Add('delete from valtabgener where codtabela='''+qryprinc.fieldbyname('codtabela').asstring+
                    ''' and codcampo='''+ strgrdtab.Cells[strgrdtab.col,0]+ '''');
     qryaux.execsql;
     qryaux.sql.clear;
     qryaux.sql.Add('delete from campotabgener where codtabela='''+qryprinc.fieldbyname('codtabela').asstring+
                    ''' and codcampo='''+ strgrdtab.Cells[strgrdtab.col,0]+ '''');
     qryaux.execsql;
     for x:=strgrdtab.col to strgrdtab.colcount-2 do
         for y:=0 to strgrdtab.rowcount-1 do
             strgrdtab.Cells[x,y]:=strgrdtab.Cells[x+1,y];
     strgrdtab.colcount:=strgrdtab.colcount-1;
  end;
  sbtnApagDet.Down:=false;

end;

procedure TfrmCadTabela.bbtnOkDet2Click(Sender: TObject);
begin
  if not VerificaMestre then begin
     MsgDlg('É preciso incluir o nome da tabela.','Atenção',mterror,[mbOk],0);
     exit;
  end;

  if (edValor.Text = '') and (dtedVlLinha.Text = '') then begin
     MsgDlg('É preciso preencher o valor da linha.','Atenção',mterror,[mbOk],0);
     exit;
  end;

  if qryDet.FieldByName('IdTipoDado').AsString = '1' then
     dbedDescLinha.Text := TrocaVirgulaPonto(edValor.Text);

  if (dsDet2.dataset.state = dsinsert) or (dsDet2.dataset.state = dsedit) then
     if dtedVlLinha.Visible then
        qryDet2.FieldbyName('VALOR').AsString := dtedVlLinha.Text
  else
      qryDet2.FieldbyName('VALOR').AsString := trocavirgulaponto(edValor.Text);

  if qryDet2.State = dsInsert then begin
     qryDet2.Post;
     qryDet2.Insert;
  end else begin
      qryDet2.Post;
      qrydet2.close;
      qrydet2.open;
      sGrdDet.Visible := True;
      carregaquerydet2;
  end;
  bbtnconfirmar.enabled:=true;
  bbtncancelar.enabled:=true;
end;

procedure TfrmCadTabela.bbtnCancelarDet2Click(Sender: TObject);
begin
   try
      qryDet2.Cancel;
      qrydet2.close;
      qrydet2.open;
      carregaquerydet2;
      sGrdDet.Visible   := True;
      bbtnconfirmar.enabled:=true;
      bbtncancelar.enabled:=true;
   except Raise;
   end;
end;

procedure TfrmCadTabela.sbtnInsLinhaClick(Sender: TObject);
var
   CamposVariaveis : variant;
begin
   CamposVariaveis    := VarArrayCreate([0,1],varVariant);
   CamposVariaveis[0] := qrydet.FieldByName('CODTABELA').AsString;
   CamposVariaveis[1] := qrydet.FieldByName('CODCAMPO').AsString;
   try
     if (VerificaMestre) and (VerificaDetalhe) then begin
        if ds.DataSet.State  = dsInsert then begin
           FazendoCloseOpen := True;
           PostMestre;
           FazendoCloseOpen := False;
           FlagInsert := True;
           ds.DataSet.Edit;
           FlagInsert := False;
        end;
        if ds.DataSet.state = dsBrowse then begin
           sbtnAlterar.Click;
           qrydet.Locate('CODTABELA;CODCAMPO', CamposVariaveis , [loCaseInsensitive]);
        end;
        dsDet2.DataSet.Insert;
        sGrdDet.Visible   := False;
        HabilitaPainel(pnlControlesDet2 , True);

        edColUtilizada.Text := BuscaNomeColuna(CamposVariaveis[0],CamposVariaveis[1]);  // alterado -
        VerificaTipoDado;
        dtedVlLinha.text:='';
     end;
   except
     sbtnInsLinha.Down := False;
     Raise;
   end;
end;

procedure TfrmCadTabela.sbtnAltLinhaClick(Sender: TObject);
begin
   sbtnAltLinha.Down := True;
   qrydet2.locate('numlinha',sgrddet.cells[1,sgrddet.row],[]);
   qrydet2.edit;
   sGrdDet.Visible   := False;
   HabilitaPainel(pnlControlesDet2 , true );
   bbtnokdet2.enabled:=true;
   bbtncancelardet2.enabled:=true;
   edColUtilizada.Text := qrydet2['codcampo'];
   VerificaTipoDado;
end;

procedure TfrmCadTabela.sbtnApagLinhaClick(Sender: TObject);
var
  CamposVariaveis       : variant;
  CamposVariaveisqryDet : variant;
begin
  inherited;
  sbtnApagLinha.Down := True;
  CamposVariaveis       := VarArrayCreate([0,2],varVariant);
  CamposVariaveisqrydet := VarArrayCreate([0,1],varVariant);

  CamposVariaveis[0] := qrydet2.FieldByName('CODTABELA').AsString;
  CamposVariaveis[1] := qrydet2.FieldByName('CODCAMPO').AsString;
  CamposVariaveis[2] := qrydet2.FieldByName('NUMLINHA').AsInteger;

  CamposVariaveisqryDet[0] := CamposVariaveis[0];
  CamposVariaveisqryDet[1] := CamposVariaveis[1];

  if ds.DataSet.state = dsBrowse then begin
     bkmkFilho2 := dsDet2.DataSet.GetBookmark;
     sbtnAlterar.Click;
     dsDet2.DataSet.GotoBookmark(bkmkFilho2);
     dsDet2.DataSet.FreeBookmark(bkmkFilho2);
     qryDet.Locate('CODTABELA;CODCAMPO' , CamposVariaveisqryDet , [loCaseInsensitive]);
  end;

  if dsDet2.DataSet.RecordCount = 0 then begin
     MsgDlg(LerMensagem(10),LerMensagem(2),mtError,[mbOk, mbHelp], 0);
     sbtnApagLinha.Down := False;
     Exit;
  end;

  try
     if MsgDlg(LerMensagem(11), LerMensagem(4), mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes then begin
        dsDet2.DataSet.Delete;
        CarregaQuerydet2;
     end;
  except Raise;
  end;
  sbtnApagLinha.Down := False;
end;

procedure TfrmCadTabela.pgctrlDetalheChanging(Sender: TObject; var AllowChange: Boolean);
begin
  if   (qryDet.state in [dsbrowse , dsinactive ])
  then  AllowChange  := True
  else  AllowChange  := False;


end;

{===================}
{===== FUNCOES =====}

function TfrmCadTabela.CarregaQuerydet2:Boolean;
var
 xLin : Integer;
begin
  with qrydet2 do
  begin

    if RecordCount = 0 then
       result := False
    else result := True;
     qrydet2.first;
     sgrddet.RowCount:=1;

    {inicio do proc. para preencher o grid}
    sGrddet.colcount:=3;
    sgrdDet.Cells[0,0] := 'Coluna';
    sgrdDet.Cells[1,0] := 'Num. linha';
    sgrdDet.Cells[2,0] := 'valor';
    xLin:= 0;
    while not Eof do
    begin
      inc(xlin);
      sgrddet.RowCount:=sgrddet.RowCount+1;
      if sgrddet.rowcount=2 then
         sgrddet.FixedRows:=1;
      sgrdDet.Cells[0,xlin] := qrydet2['codcampo'];
      sgrdDet.Cells[1,xlin] := qrydet2['numlinha'];
      if qryDet.FieldByName('IdTipoDado').AsString = '1' then
         sgrdDet.Cells[2,xlin] := trocapontovirgula(qrydet2['valor'])
      else
         sgrdDet.Cells[2,xlin] := qrydet2['valor'];

      qrydet2.next;

    end;
 //   Close;
  end;
end;



function TfrmCadTabela.VerificaMestre : boolean;
begin
  result := (not(dbedDescricao.Text = ''));
end;

function TfrmCadTabela.VerificaDetalhe : boolean;
var
  CamposVariaveis : variant;
begin
  CamposVariaveis    := VarArrayCreate([0,1],varVariant);
  CamposVariaveis[0] := qryDet.FieldByName('CODTABELA').AsString;
  CamposVariaveis[1] := qryDet.FieldByName('CODCAMPO').AsString;

  qryDet.Close;
  qryDet.Open;
  qryDet.Locate('CODTABELA; CODCAMPO', CamposVariaveis , [loCaseInsensitive]);
  result := (not(qryDet.recordCount = 0));
end;

function TfrmCadTabela.PostDetalhe : boolean ;
var
   varFields : Variant;
begin
  Result := False;
  if qryDet.State in [dsinsert, dsedit]
  then begin
    varFields    := VarArrayCreate([0,1],varVariant);
    varFields[0] := qryDet.FieldByName('CODTABELA').AsString;
    varFields[1] := qryDet.FieldByName('CODCAMPO').AsString;
    qryDet.Post;
    qryDet.Close;
    qryDet.Open;
    qryDet.Locate('CODTABELA; CODCAMPO', varFields, [loCaseInsensitive]);
    result := True;
  end;
end;

function TfrmCadTabela.PostDetalhe2: Boolean;
var
   varFields : Variant;
begin
    if qryDet2.State in [dsinsert, dsedit]
    then begin
       try
          varFields    := VarArrayCreate([0,2],varVariant);
          varFields[0] := qryDet2.FieldByName('CODTABELA').AsString;
          varFields[1] := qryDet2.FieldByName('CODCAMPO').AsString;
          varFields[2] := qryDet2.FieldByName('NUMLINHA').AsInteger;
          qryDet2.Post;
          qryDet2.Close;
          qryDet2.Open;
          qryDet2.Locate('CODTABELA;CODCAMPO;NUMLINHA' , varFields , [loCaseInsensitive]);
          Result := true;
       except
          Raise;
          Result := false;
       end;
    end
    else begin
       Result := false;
    end
end;

function TfrmCadTabela.PostMestre : boolean ;
var
  id : String;
begin
  Result := False;
  id := qryprinc.fieldbyname('CODTABELA').AsString;
  if qryPrinc.State in [dsinsert, dsedit] then begin
       qryPrinc.Post;
       qryPrinc.ApplyUpdates;
       qryPrinc.CommitUpdates;
       qryprinc.Close;
       qryprinc.ParamByName('IDUSUARIO').AsInteger := Sistema.IdUsuario;
       qryprinc.Open;
       qryPrinc.Locate('CODTABELA' , id , [loCaseInsensitive]);
       result := true;
  end;
end;

procedure TfrmCadTabela.btnLinhasClick(Sender: TObject);
begin
  //inherited;
  if CarregaQueryLinhas then
     pnLinhas.Visible := True
  else
     MsgDlg('A tabela está vazia.','Atenção',mterror,[mbOk],0);
end;

procedure TfrmCadTabela.btnSairLinhaClick(Sender: TObject);
begin
  pnLinhas.Visible := False;
end;

function TfrmCadTabela.CarregaQueryLinhas:Boolean;
var
  i,xMaxlin, xLin, xCol, xcont : Integer;
  xcampo,sSQL : String;

begin
  limpagrid;
  qrydet.close;
  qrydet.open;
  qrydet2.close;
  qrydet2.open;
  
  with qryLinhas do
  begin
    Close;
    sSQL := 'SELECT LIN.NUMLINHA, LIN.VALOR, COL.DESCRICAO, '+
            '       LIN.CODTABELA, COL.CODCAMPO             '+
            'FROM CAMPOTABGENER COL, VALTABGENER   LIN      '+
            'WHERE  COL.CODTABELA  ='''+Qryprinc.FieldByName('CODTABELA').AsString+''' '+
            'AND    COL.CODTABELA = LIN.CODTABELA(+) '+
            'AND    COL.CODCAMPO  = LIN.CODCAMPO(+)  '+
            'ORDER  BY LIN.CODTABELA, LIN.CODCAMPO,LIN.NUMLINHA ';

    SQL.Clear;
    SQL.Add(sSQL);
    Open;
    if RecordCount = 0 then
       result := False
    else
       result := True;

    {inicio do proc. para dimensionar o grid}
    xMaxlin    := 0;
    xcont      := 0;
    xcampo:=qrylinhas.fieldbyname('codcampo').asstring;

    while not qrylinhas.EOF do
    begin
        inc(xcont);
        xlin:=0;
        while (qrylinhas.fieldbyname('codcampo').asstring=xcampo) and (not(qrylinhas.eof)) do
        begin
            qrylinhas.next;
            inc(xlin);
        end;
        if xlin>xmaxlin then
           xmaxlin:=xlin;
        xcampo:=qrylinhas.fieldbyname('codcampo').asstring;
    end;
    if xmaxlin= 0 then
       strgrdtab.rowcount:=2
    else
       strgrdtab.rowcount:=xmaxlin+1;

    strgrdtab.colcount:= xcont+1;
    strgrdtab.FixedRows:=1;
    {fim do proc. para dimensionar o grid}


    {inicio do proc. para preencher o grid}
    qryLinhas.First;
    strgrdtab.Cells[0,0] := 'NÚM.LINHA';

    xLin:= 1;
    xcol:=1;
    while not Eof do
    begin
      xcampo:=qrylinhas.fieldbyname('codcampo').asstring;
      strgrdtab.Cells[xcol,0] := qrylinhas.fieldbyname('codcampo').asstring;
      while (qrylinhas.fieldbyname('codcampo').asstring=xcampo) and (not qrylinhas.eof) do
      begin
          strgrdtab.cells[0,xlin]:=qrylinhas.fieldbyname('numlinha').asstring;
          if qryDet.FieldByName('IdTipoDado').AsString = '1' then
             strgrdtab.cells[xcol,xlin]:=trocapontovirgula(qrylinhas.fieldbyname('valor').asstring)
          else
             strgrdtab.cells[xcol,xlin]:=qrylinhas.fieldbyname('valor').asstring;

          inc(xlin);
          qrylinhas.next;
      end;
      inc(xcol);
      xcampo:=qrylinhas.fieldbyname('codcampo').asstring;
      xlin:=1;
    end;
 //   Close;
  end;
  strgrdtab.Cells[0,1] := '1';
  for i:=0 to StrGrdTab.Colcount-1 do
      StrGrdTab.ColWidths[i]:=120;

end;

function TfrmCadTabela.BuscaNomeColuna(aCodTabela,aCodCampo:String) : string;
begin
  with QryAux do
  begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT DESCRICAO            ');
    Sql.Add('FROM   CAMPOTABGENER   ');
    Sql.Add('WHERE  CODTABELA = :V0 ');
    Sql.Add('AND    CODCAMPO  = :V1 ');
    Params[0].AsString := aCodTabela;
    Params[1].AsString := aCodCampo;
    Open;
    BuscaNomeColuna := FieldByName('DESCRICAO').AsString;
    Close;
  end;
end;

procedure TfrmCadTabela.VerificaTipoDado;
begin
  if qryDet.FieldByName('IDTIPODADO').AsInteger = 3 then
    begin
       dtedVlLinha.Visible   := True;
       dtedVlLinha.Text:=sgrddet.Cells[2,sgrddet.row];
       dbedDescLinha.Visible := False;
       edvalor.visible:=false;
       dtedVlLinha.SetFocus;
    end
  else
    begin
        edValor.Visible := True;
        dtedVlLinha.Visible   := False;
        edValor.SetFocus;
    end;
end;

procedure TfrmCadTabela.dbedDescLinhaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if qryDet.FieldByName('IDTIPODADO').AsInteger = 1 then
     dbedDescLinha.Text := ValNumero(dbedDescLinha.Text);
end;

function TfrmCadTabela.ValNumero(Numero:str20):str20;
var
  Tam,
  Posic:byte;
  HouveErro:boolean;
begin
  ValNumero:=Numero;
  Numero   :=trim(Numero);
  if Numero ='' then
     exit;

  Posic    := 1;
  HouveErro:= false;
  repeat
    if not (Numero[Posic] in ['0'..'9','.',',','-'])
       then begin
              HouveErro:=true;
              delete(Numero,Posic,1);
            end
       else inc(Posic);
    Tam:=Length(Numero);
  until HouveErro or (Posic>Tam) or (Tam=0);
  if HouveErro then
     MsgDlg('Valor Inválido.','Atenção',mterror,[mbOk],0);
  ValNumero := Numero;
end;

procedure TfrmCadTabela.qryDetAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryDet.fieldbyname('CODTABELA').AsString := qryprinc.fieldbyname('CODTABELA').AsString ;
end;

procedure TfrmCadTabela.qryDetAfterScroll(DataSet: TDataSet);
begin
  inherited;
  dbedDescCampo.text := qryDet.fieldbyname('DESCRICAO').AsString;
end;

procedure TfrmCadTabela.qryDetBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  pgctrlDetalhe.ActivePage := tbshDetalhe;
end;

procedure TfrmCadTabela.qryDetBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  pgctrlDetalhe.ActivePage := tbshDetalhe;
end;

procedure TfrmCadTabela.qryDetBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  pgctrlDetalhe.ActivePage := tbshDetalhe;
end;

procedure TfrmCadTabela.qryDet2AfterInsert(DataSet: TDataSet);
Var
  sSQL:String;
begin
  inherited;
  with qryselect do begin
      Close;
      SQL.Clear;
      sSql := 'SELECT MAX(NUMLINHA) AS MAXIMO FROM  VALTABGENER '+
              'WHERE  CODTABELA = '+QuotedStr(QryDet.FieldByName('CODTABELA').AsString)+
              ' AND   CODCAMPO  = '+QuotedStr(QryDet.FieldByName('CODCAMPO').AsString);
      SQL.Add(sSQL);

      Open;
  end;

  qryDet2.fieldbyname('NUMLINHA').AsInteger := QrySelect.fieldbyname('MAXIMO').AsInteger + 1 ;
  qryDet2.fieldbyname('CODTABELA').AsString := QryDet.fieldbyname('CODTABELA').AsString ;
  qryDet2.fieldbyname('CODCAMPO').AsString  := QryDet.fieldbyname('CODCAMPO').AsString ;
  qryselect.close;
end;

procedure TfrmCadTabela.qryDet2AfterScroll(DataSet: TDataSet);
begin
  inherited;
  dbedDescLinha.text := qryDet2.fieldbyname('VALOR').AsString;
  edValor.Text := TrocaPontoVirgula(dbedDescLinha.Text);
end;

function TfrmCadTabela.TrocaPontoVirgula(Value: String): String;
var
  iPosVirg : Integer;
begin
  iPosVirg := pos('.',Value);
  if iPosVirg <> 0 then
    Value := copy(Value,1,iPosVirg-1)+','+copy(Value,iPosVirg+1,length(Value));
  TrocaPontoVirgula := Value;
end;

function TfrmCadTabela.TrocaVirgulaPonto(Value: String): String;
var
  iPosVirg : Integer;
begin
  iPosVirg := pos(',',Value);
  if iPosVirg <> 0 then
    Value := copy(Value,1,iPosVirg-1)+'.'+copy(Value,iPosVirg+1,length(Value));
  TrocaVirgulaPonto := Value;
end;

procedure TfrmCadTabela.qryDet2Valor_formatChange(Sender: TField);
begin
  inherited;
  qrydet2['valor']:=trocavirgulaponto(qrydet2['valor_format']);
end;

procedure TfrmCadTabela.pgctrlDetalheChange(Sender: TObject);
begin
  inherited;
  if pgctrlDetalhe.ActivePage=tabsheet1 then
     if qrydet2.active=true then
        carregaquerydet2;
end;

procedure TfrmCadTabela.sbtnAlterarClick(Sender: TObject);
begin
  if (QryPrinc.FieldByName('FLGALTERAR').AsInteger = 0) then begin
     MsgDlg('O usuário ('+Sistema.NomeUsuario+') não está autorizado a Alterar esta Tabela Genérica .',
            'Erro',mtError,[mbOk,mbHelp],0);
     sbtnAlterar.Down := False;
     Exit;
  end;

  pnlFundo.Enabled := True;
  inherited;

  //BRUNO AZEVEDO SOL 178775 KINTANA 1642943
  pnlFundo.enabled := True;
  sbtnInsDet.Enabled := True;
  sbtnAltDet.Enabled := True;
  sbtnApagDet.Enabled := True;
  BtExcluiLinha.Enabled := True;
  BtInsereLinha.Enabled := True;
  btnBtInsereLinhaB.Enabled := True;
  StrGrdTab.Options := StrGrdTab.Options + [goEditing];
end;

procedure TfrmCadTabela.StrGrdTabKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  I:integer;
  vazia:boolean;
begin
  inherited;
  if (Ord(Key) = 40) or (Ord(Key) = 38) or (Ord(Key)=37) or (Ord(Key)=39) then
     if not TrataCelulas then
        Key := 13;
        
  vazia:=true;
  if (key=40) and (strgrdtab.row=strgrdtab.rowcount-1) then
     begin
        for i:=1 to strgrdtab.ColCount-1 do
            if strgrdtab.Cells[i,strgrdtab.row]<>'' then
               vazia:=false;

        if not(vazia) then
           begin
              strgrdtab.rowCount:=strgrdtab.rowCount+1;
              strgrdtab.Cells[0,strgrdtab.rowCount-1]:=inttostr(strgrdtab.rowCount-1);
           end;
     end;
end;

procedure TfrmCadTabela.dsDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if qryPrinc.State <> dsInsert then
     CarregaQueryLinhas;
end;
procedure tfrmcadtabela.incluicoluna;
begin
  if StrGrdTab.colcount =1 then
    if StrGrdTab.Cells[0,0]='' then
       StrGrdTab.Cells[0,0]:= nomecampo
    else
       begin
          StrGrdTab.colcount:=StrGrdTab.colcount+1;
          StrGrdTab.Cells[StrGrdTab.colcount-1,0]:=nomecampo;
       end
  else
    begin
       StrGrdTab.colcount:=StrGrdTab.colcount+1;
       StrGrdTab.Cells[StrGrdTab.colcount-1,0]:= nomecampo;
    end;
end;

procedure TfrmCadTabela.Button1Click(Sender: TObject);
begin
  inherited;
  MsgDlg(strgrdtab.cells[1,3],'Atenção',mterror,[mbOk],0);
end;

procedure tfrmcadtabela.limpagrid;
var
  x,y:integer;
begin
   for x:=0 to strgrdtab.colcount-1 do
      for y:=0 to strgrdtab.rowcount-1 do
         strgrdtab.cells[x,y]:='';
end;
procedure TfrmCadTabela.BtExcluiLinhaClick(Sender: TObject);
var
  x,y:integer;
begin
  inherited;
  if  MsgDlg('Deseja realmente excluir esta Linha ?','Atenção',mtConfirmation,
                  [mbyes,mbno,mbHelp],0)=mryes then
  begin
     for x:=1 to strgrdtab.ColCount -1 do
     begin
         qryaux.close;
         qryaux.sql.clear;
         qryaux.sql.Add('DELETE FROM VALTABGENER WHERE CODTABELA='''+
                        qryprinc.fieldbyname('CODTABELA').asstring+
                        ''' AND CODCAMPO='''+ strgrdtab.Cells[x,0]+ ''' AND '+
                        'VALOR='''+strgrdtab.Cells[x,strgrdtab.row]+''' AND NUMLINHA='+
                        strgrdtab.Cells[0,strgrdtab.row]);
         qryaux.execsql;
     end;

     for y:=strgrdtab.row to strgrdtab.rowcount-2 do
         for x:=1 to strgrdtab.colcount-1 do
             begin
                strgrdtab.Cells[x,y]:=strgrdtab.Cells[x,y+1];
                qryaux.close;
                qryaux.sql.clear;
                qryaux.sql.Add('update valtabgener set numlinha= '+strgrdtab.Cells[0,strgrdtab.row]+
                               ' where codtabela='''+qryprinc.fieldbyname('codtabela').asstring+
                               ''' and codcampo='''+ strgrdtab.Cells[x,0]+ ''' and '+
                               'valor='''+strgrdtab.Cells[x,strgrdtab.row]+''' and numlinha='+
                               inttostr(strtoint(strgrdtab.Cells[0,strgrdtab.row])+1));
                qryaux.execsql;
             end;
     strgrdtab.rowcount:=strgrdtab.rowcount-1;
  end;
end;

procedure TfrmCadTabela.BtInsereLinhaClick(Sender: TObject);
var
  x,y:integer;
begin
  inherited;
  sbtnalterarclick(sender);

  strgrdtab.rowcount:=strgrdtab.rowcount+1;
  for x:=strgrdtab.rowcount-1 downto strgrdtab.row do
     for y:=0 to strgrdtab.colcount-1 do
         if y=0 then
            strgrdtab.Cells[y,x]:=inttostr(x)
         else
            strgrdtab.Cells[y,x]:=strgrdtab.Cells[y,x-1];
     for y:=1 to strgrdtab.colcount-1 do
            strgrdtab.Cells[y,strgrdtab.row]:='';

end;

procedure TfrmCadTabela.StrGrdTabSelectCell(Sender: TObject; Col,
  Row: Integer; var CanSelect: Boolean);
var
   x : LongInt;
begin
  inherited;
  for x:=1 to strgrdtab.ColCount-1 do
      if trim(strgrdtab.cells[x,1])='' then
         strgrdtab.cells[x,1]:='0';
end;

procedure TfrmCadTabela.FormCreate(Sender: TObject);
begin

  //Jéssica Lana SOL 109421 KINTANA 496332
  Sd.InitialDir:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

  qryprinc.Close;
  qryprinc.ParamByName('IDUSUARIO').AsInteger := Sistema.IdUsuario;
  qryprinc.Open;
  { Preenche o ususario do MontaSelect de pesquisa de Regras }
  MontaSelect1.Filtro.Add ('TABGENERUSUARIO.IDUSUARIO = '+
                           IntToStr(Sistema.IdUsuario));
  inherited;
end;

procedure TfrmCadTabela.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect1.Executar;
  if MontaSelect1.RetornouValor then
     qryprinc.locate('codtabela',Montaselect1.ValoresChave[0],[]);
  sbtnProcurar.Down := False;
end;

procedure TfrmCadTabela.BitBtnExportarClick(Sender: TObject);
var
  I, ln, cl, wAcerto : LongInt;
  Aux : TStringList;
  vLin : String;
  VetTamanhoColunas : Array[0..100] of Integer;
begin
  inherited;
  Sd.FileName := wwdbeNome.Text+'.txt';
  If Not SD.Execute Then Exit;

  frmAguarde.Mostra('Selecionando dados ...');
  frmAguarde.Refresh;
  frmAguarde.Pos := 0;
  frmAguarde.Min := 0;
  frmAguarde.Max := StrGrdTab.RowCount;
  frmAguarde.Refresh;

  { Guarda os tamanhos a utilizar como maximo da coluna }
  VetTamanhoColunas[0] := 10; { Coluna NUMLINHA }
  For I := 1 To (StrGrdTab.Colcount-1) Do Begin
    VetTamanhoColunas[I] := BuscaTamanhoColuna(wwdbeNome.Text, strgrdtab.cells[I, 0]);

    If VetTamanhoColunas[I] < Length(strgrdtab.cells[I, 0]) Then Begin
      VetTamanhoColunas[I] := Length(strgrdtab.cells[I, 0]);
    end;
    
  End;

  Aux := TStringList.Create;

  StrGrdTab.Refresh;


  for ln := 0 to StrGrdTab.RowCount do begin { Linhas da Tabela }
      frmAguarde.Pos := ln;
      vLin := '';

      for cl := 0 to StrGrdTab.Colcount-1 do begin { Colunas da Tabela }

        wAcerto := (VetTamanhoColunas[CL]+1) - Length(strgrdtab.cells[cl, ln]);
        vLin := vLin +
                Trim(strgrdtab.cells[cl, ln])+ ' ' +
                Replicate(' ',wAcerto);
      end;

      Aux.Add(vLin);
  end;

  frmAguarde.Mostra('Salvando Arquivo '+Sd.FileName+' ...');
  frmAguarde.Refresh;

  Aux.SaveToFile(Sd.FileName);
  frmAguarde.Apaga;
end;

procedure TfrmCadTabela.StrGrdTabKeyPress(Sender: TObject; var Key: Char);
Var
  Tecla:String;
begin
  inherited;
//--------------
  if (Ord(Key) = 13) then
     TrataCelulas;

// Transforma Tecla em Mauscula
  Tecla:=' ';
  Tecla[1]:=Key;
  Tecla   :=AnsiUpperCase(Tecla);
  Key     :=Tecla[1];
end;

function TfrmCadTabela.TrataCelulas : Boolean;
var
   Campo, Celula : String;
begin
     inherited;
     Result := True;
     Campo := strgrdtab.Cells[StrGrdTab.Col,0];
     Celula := strgrdtab.Cells[StrGrdTab.Col,StrGrdTab.Row];

     with QryAux2 do begin
          Close;
          Sql.Clear;
          Sql.Add('SELECT T.NOMETIPODADO TIPO FROM CAMPOTABGENER C, TIPODADO T WHERE ');
          Sql.Add('T.IDTIPODADO = C.IDTIPODADO AND	CODTABELA = '''+qryPrinc.FieldbyName('CODTABELA').AsString+''' AND CODCAMPO = '''+Campo+'''');
          Open;
     end;

     if not QryAux2.IsEmpty then begin
        if Copy(UpperCase(QryAux2.FieldbyName('TIPO').AsString),1,1) = 'N' then begin
           try
              StrtoFloat(Celula);
           except
                 begin
                      MsgDlg('O conteúdo da celula ('+Celula+') não é do tipo numérico.','Erro',mtError,[mbOk],0);
                      Result := False;
                 end;
           end;
        end;
        if Copy(UpperCase(QryAux2.FieldbyName('TIPO').AsString),1,1) = 'D' then begin
           try
              StrtoDate(Celula);
           except
                 begin
                      MsgDlg('O conteúdo da celula ('+Celula+') não é do tipo data.','Erro',mtError,[mbOk],0);
                      Result := False;
                 end;
           end;
        end;
     end;
end;


procedure TfrmCadTabela.CmeCadastroConfirma(Sender: TObject);
var
  id : String;
  bInserindo : Boolean;
begin
//  Inherited;
  bInserindo := False;
  id := qryprinc.fieldbyname('CODTABELA').AsString;
  if qryPrinc.State in [dsinsert, dsedit] then begin

       qryprinc.fieldbyname('IDMODULO').AsInteger := Sistema.IdModulo;
       qryprinc.fieldbyname('IDPESSOA').AsInteger := Sistema.IdEmpresa;

       If QryPrinc.State In [dsinsert] Then bInserindo := True;
       qryPrinc.Post;
       qryPrinc.ApplyUpdates;
       qryPrinc.CommitUpdates;

       { Caso esteja incluindo, gera autorizações }
       If bInserindo = True Then Begin
         IncluiAutorizacao( ID );
       End;

       qryprinc.Close;
       qryprinc.ParamByName('IDUSUARIO').AsInteger := Sistema.IdUsuario;
       qryprinc.Open;
       qryPrinc.Locate('CODTABELA' , id , [loCaseInsensitive]);

  end;

end;

{------------------------------------------------------------------------------}
{ Retorna o tamanho do maior valor na coluna informada                         }
function TfrmCadTabela.BuscaTamanhoColuna(sTabela, sColuna: String): Integer;
Var
  sSQL : String;
begin
  Result := 60;

  sSQL := 'SELECT '+
          ' MAX(LENGTH(VALOR)) AS MAIORVALOR '+
          'FROM   '+
          ' VALTABGENER '+
          'WHERE  '+
          ' CODTABELA = '+QuotedStr(sTabela)+' AND '+
          ' CODCAMPO  = '+QuotedStr(sColuna);
  If FazQuery(QryAux,sSQL) Then Begin
    Result := QryAux.FieldByName('MAIORVALOR').AsInteger
  End;
end;

function TfrmCadTabela.AbrePermissao(Tipo: Integer): Boolean;
begin
  With QryPermissao do begin
    Close;
    ParambyName('GRUPO').AsInteger   := Tipo;
    ParambyName('USUARIO').AsInteger := Sistema.IdUsuario;
    Open;
  End;
  Result := True;
  if QryPermissao.IsEmpty then
     Result := False;
end;

procedure TfrmCadTabela.IncluiAutorizacao(sCodTabela : String);
Var
  sSQL : String;
begin
  sSQL := 'INSERT INTO TABGENERUSUARIO '+
          ' (CODTABELA, IDUSUARIO, FLGALTERAR, FLGEXCLUIR, FLGPROCURAR) VALUES '+
          ' ('+QuotedStr(sCodTabela)+', '+
          IntToStr(Sistema.IdUsuario) +', '+
          '1, 1, 1) ';
  If Not ExecutarQuery(QryAux,sSQL) Then Begin
     MsgDlg('Erro ao incluir autorização.','Erro',mterror,[mbOk],0);
     Exit;
  End;
end;

procedure TfrmCadTabela.ExcluiAutorizacao(sCodTabela : String);
Var
  sSQL : String;
begin
  sSQL := 'DELETE FROM TABGENERUSUARIO WHERE '+
          ' CODTABELA = '+QuotedStr(sCodTabela)+' AND '+
          ' IDUSUARIO = '+IntToStr(Sistema.IdUsuario);
  If Not ExecutarQuery(QryAux,sSQL) Then Begin
     MsgDlg('Erro ao excluir autorização.','Erro',mterror,[mbOk],0);
     Exit;
  End;
end;

procedure TfrmCadTabela.btnBtInsereLinhaBClick(Sender: TObject);
var
  x,y:integer;
  SelectedRow:integer;
begin
//  SOL 161282 KINTANA 1358379 Douglas.siqueira.
  inherited;
  sbtnalterarclick(sender);


  SelectedRow:=0;
  SelectedRow:=StrGrdTab.Row+1;



  strgrdtab.rowcount:=strgrdtab.rowcount+1;
  for x:=strgrdtab.rowcount-1 downto 1 do
     begin                
     for y:=0 to strgrdtab.colcount-1 do
         begin
         if y=0 then
            begin
            if strgrdtab.Cells[y,x]='' then
               strgrdtab.Cells[y,x]:=inttostr(x)
            else
            strgrdtab.Cells[y,x]:=strgrdtab.Cells[y,x];
            end
         else
            begin
            if x>=SelectedRow then
               begin
               strgrdtab.Cells[y,x]:=strgrdtab.Cells[y,x-1];

               if x=SelectedRow then
                  strgrdtab.Cells[y,x]:='';
               end;

            end;
         end;
     end;
   

end;

end.
