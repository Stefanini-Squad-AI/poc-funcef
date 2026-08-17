unit FDataDic;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, StdCtrls, Grids, DBGrids, Db, DBTables, Buttons,
  DBCtrls, Mask, Wwquery, Wwdatsrc, wwdbedit, wwriched, MontaSelect,
  ImgList;

type
  TFrmDataDic = class(TForm)
    ScbDataDic: TScrollBox;
    Splitter1: TSplitter;
    NtbTabFields: TNotebook;
    ImageList1: TImageList;
    Panel1: TPanel;
    TreeDataDic: TTreeView;
    Panel2: TPanel;
    DadosTabelas: TPageControl;
    TbsTabela: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    TbsRelacionamentos: TTabSheet;
    Bevel2: TBevel;
    Memo2: TMemo;
    Memo3: TMemo;
    Panel3: TPanel;
    Panel4: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    Bevel4: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Bevel3: TBevel;
    DBCheckBox4: TDBCheckBox;
    Label9: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label10: TLabel;
    DsDetalheTabela: TwwDataSource;
    QryDetalheTabela: TwwQuery;
    QryTableField: TwwQuery;
    DsDetalheCampos: TwwDataSource;
    QryDetalheCampos: TwwQuery;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    wwDBEdit4: TwwDBEdit;
    wwDBEdit5: TwwDBEdit;
    wwDBRichEdit1: TwwDBRichEdit;
    wwDBRichEdit2: TwwDBRichEdit;
    wwDBEdit6: TwwDBEdit;
    wwDBEdit7: TwwDBEdit;
    MsTabelas: TMontaSelect;
    MsCampos: TMontaSelect;
    QryDetalheTabelaTABLENAME: TStringField;
    QryDetalheTabelaTABLEALIAS: TStringField;
    QryDetalheTabelaDESCRICAO: TMemoField;
    QryTableFieldIDDDTABLE: TFloatField;
    QryTableFieldTABLENAME: TStringField;
    QryTableFieldTABLEALIAS: TStringField;
    QryTableFieldFIELDNAME: TStringField;
    QryTableFieldIDDDFIELD: TFloatField;
    QryTableFieldFIELDALIAS: TStringField;
    QryDetalheCamposFIELDNAME: TStringField;
    QryDetalheCamposFIELDALIAS: TStringField;
    QryDetalheCamposDESCRICAO: TMemoField;
    QryDetalheCamposTAMANHO: TFloatField;
    QryDetalheCamposTIPOCHAVE: TFloatField;
    QryDetalheCamposSELECTABLE: TFloatField;
    QryDetalheCamposSEARCHABLE: TFloatField;
    QryDetalheCamposSORTABLE: TFloatField;
    QryDetalheCamposTIPODEDADO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TreeDataDicClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure TreeDataDicChange(Sender: TObject; Node: TTreeNode);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
    LstIdTabCampo: TStringLIst;
    iOldIndex: Integer;
    bArvoreMotada: Boolean;
  public
    { Public declarations }
  end;

var
  FrmDataDic: TFrmDataDic;

implementation

uses FAguardeDDic;

{$R *.DFM}

procedure TFrmDataDic.FormShow(Sender: TObject);
Var
  iOldCodTable: Integer;
  NoTabela, NoFilho: TTreeNode;
begin
  If TreeDataDic.Items.Count = 0 Then
  Begin
       FrmAguardeDDic.Show;
       Application.ProcessMessages;

       QryTableField.Open;
       iOldCodTable := 0;
       NoTabela := Nil;

       While Not QryTableField.Eof DO
       Begin
          IF iOldCodTable <> QryTableField.FieldByName('IDDDTABLE').AsInteger Then
          Begin
             NoTabela := TreeDataDic.Items.Add(Nil,QryTableField.FieldByName('TABLEALIAS').AsString);
             NoTabela.ImageIndex    := 0;
             NoTabela.SelectedIndex := 0;
             NoTabela.StateIndex    := 0;
             iOldCodTable := QryTableField.FieldByName('IDDDTABLE').AsInteger;
             LstIdTabCampo.Add('T' + QryTableField.FieldByName('IDDDTABLE').AsString);
          End;

          NoFilho := TreeDataDic.Items.AddChild(NoTabela,QryTableField.FieldByName('FIELDALIAS').AsString);
          NoFilho.ImageIndex    := 1;
          NoFilho.SelectedIndex := 1;
          NoFilho.StateIndex    := 1;
          LstIdTabCampo.Add('C' + QryTableField.FieldByName('IDDDFIELD').AsString);

          QryTableField.Next;
       End;
       QryTableField.Close;
       Application.ProcessMessages;
       FrmAguardeDDic.Close;
       bArvoreMotada := True;
  End;
  If Not QryDetalheTabela.Prepared Then QryDetalheTabela.Prepare;
  If Not QryDetalheCampos.Prepared Then QryDetalheCampos.Prepare;
end;

procedure TFrmDataDic.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   QryDetalheTabela.Close;
   If QryDetalheTabela.Prepared Then QryDetalheTabela.Unprepare;

   QryDetalheCampos.Close;
   If QryDetalheCampos.Prepared Then QryDetalheCampos.Unprepare;
end;

procedure TFrmDataDic.FormCreate(Sender: TObject);
begin
  LstIdTabCampo := TStringList.Create;
  bArvoreMotada := False;
end;

procedure TFrmDataDic.FormDestroy(Sender: TObject);
begin
  LstIdTabCampo.Free;
end;

procedure TFrmDataDic.TreeDataDicClick(Sender: TObject);
begin
  NtbTabFields.PageIndex := TreeDataDic.Selected.ImageIndex;

  Screen.Cursor := CrHourGlass;

  If iOldIndex <> TreeDataDic.Selected.AbsoluteIndex Then
  Begin

       Case NtbTabFields.PageIndex Of
       0: //Tabelas
       Begin
            If QryDetalheCampos.Active Then QryDetalheCampos.Close;
            If QryDetalheTabela.Active Then QryDetalheTabela.Close;
            If Not QryDetalheTabela.Prepared Then QryDetalheTabela.Prepare;
            QryDetalheTabela.Params[0].AsInteger := StrToInt(Copy(LstIdTabCampo[TreeDataDic.Selected.AbsoluteIndex],2,Length(LstIdTabCampo[TreeDataDic.Selected.AbsoluteIndex])));
            QryDetalheTabela.Open;
       End;
       1: //Campos
       Begin
            If QryDetalheTabela.Active Then QryDetalheTabela.Close;
            If QryDetalheCampos.Active Then QryDetalheCampos.Close;
            If Not QryDetalheCampos.Prepared Then QryDetalheCampos.Prepare;
            QryDetalheCampos.Params[0].AsInteger := StrToInt(Copy(LstIdTabCampo[TreeDataDic.Selected.AbsoluteIndex],2,Length(LstIdTabCampo[TreeDataDic.Selected.AbsoluteIndex])));
            QryDetalheCampos.Open;
       End;
       End;

       iOldIndex := TreeDataDic.Selected.AbsoluteIndex
  End;
  Screen.Cursor := CrDefault;
end;

procedure TFrmDataDic.FormActivate(Sender: TObject);
begin
   iOldIndex := -1;
end;


procedure TFrmDataDic.SpeedButton4Click(Sender: TObject);
begin
   Close;
end;

procedure TFrmDataDic.TreeDataDicChange(Sender: TObject; Node: TTreeNode);
begin
   If bArvoreMotada Then TreeDataDicClick(Self);
end;

procedure TFrmDataDic.SpeedButton1Click(Sender: TObject);
begin
  If MsTabelas.Executar = MrOk Then
  Begin
     bArvoreMotada := False;
     TreeDataDic.FullCollapse;
     TreeDataDic.Items.Item[LstIdTabCampo.IndexOf('T' +  MsTabelas.ValoresChave[0])].Selected := True;
     TreeDataDicClick(Self);
     TreeDataDic.Selected.Expand(True);
     TreeDataDic.SetFocus;
     bArvoreMotada := True;
  End;
end;

procedure TFrmDataDic.SpeedButton2Click(Sender: TObject);
begin
  If MsCampos.Executar = MrOk Then
  Begin
     bArvoreMotada := False;
     TreeDataDic.FullCollapse;
     TreeDataDic.Items.Item[LstIdTabCampo.IndexOf('C' +  MsCampos.ValoresChave[1])].Selected := True;
     TreeDataDicClick(Self);
     TreeDataDic.SetFocus;
     bArvoreMotada := True;
  End;
end;

end.
