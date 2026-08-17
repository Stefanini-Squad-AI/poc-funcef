unit FDataDicMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FPAI, IvDictio, IvMulti, IvEMulti, ExtCtrls, Buttons, StdCtrls, DBCtrls,
  Mask, wwdbedit, ComCtrls, wwriched, Db, DBClient, MontaSelect, ImgList,
  uCtrlDdTable, uCtrlDdField;

type
  TFrmDataDic = class(TfrmPai)
    Panel1: TPanel;
    TreeDataDic: TTreeView;
    ScbDataDic: TScrollBox;
    NtbTabFields: TNotebook;
    DadosTabelas: TPageControl;
    TbsTabela: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label10: TLabel;
    wwDBRichEdit2: TwwDBRichEdit;
    wwDBEdit6: TwwDBEdit;
    wwDBEdit7: TwwDBEdit;
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
    Bevel4: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Bevel3: TBevel;
    Label9: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    wwDBEdit4: TwwDBEdit;
    wwDBEdit5: TwwDBEdit;
    wwDBRichEdit1: TwwDBRichEdit;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Splitter1: TSplitter;
    ImageList1: TImageList;
    MsTabelas: TMontaSelect;
    MsCampos: TMontaSelect;
    CdsDetTabela: TClientDataSet;
    DsDetTabela: TDataSource;
    DsDetCampo: TDataSource;
    CdsDetCampo: TClientDataSet;
    CdsTabCampo: TClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TreeDataDicClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure TreeDataDicChange(Sender: TObject; Node: TTreeNode);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
    bArvoreMotada: Boolean;
    iOldIndex: Integer;
    LstIdTabCampo: TStringLIst;
  public
    { Public declarations }
    DdTable: TCtrlDdTable;
    DdField: TCtrlDdField;
  end;

var
  FrmDataDic: TFrmDataDic;

implementation

Uses uMensErro, dBasedados, uSistema, uMidasUtil, FAguardeDDic;

{$R *.DFM}

procedure TFrmDataDic.FormCreate(Sender: TObject);
begin
  inherited;
  LstIdTabCampo := TStringList.Create;
  bArvoreMotada := False;

  DdTable := TCtrlDdTable.Create();
  DdTable.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  DdField := TCtrlDdField.Create();
  DdField.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True );

  CdsDetTabela.Data := DdTable.ListaDdTable( -1 );
  CdsDetCampo.Data  := DdField.ListaDdField( -1 );
  CdsTabCampo.Data  := DdTable.ListaDdTableField( -1, -1 );
end;

procedure TFrmDataDic.FormShow(Sender: TObject);
Var
  iOldCodTable: Integer;
  NoTabela, NoFilho: TTreeNode;
begin
  inherited;
  If TreeDataDic.Items.Count = 0 Then Begin
     FrmAguardeDDic.Show;
     Application.ProcessMessages;
     CdsTabCampo.Data := DdTable.ListaDdTableField( 0, 0 );
     CdsTabCampo.First;
     iOldCodTable := 0;
     NoTabela := Nil;

     While Not CdsTabCampo.Eof DO Begin
           If iOldCodTable <> CdsTabCampo.FieldByName( 'IDDDTABLE' ).AsInteger Then Begin
              NoTabela := TreeDataDic.Items.Add( Nil, CdsTabCampo.FieldByName( 'TABLEALIAS' ).AsString );
              NoTabela.ImageIndex    := 0;
              NoTabela.SelectedIndex := 0;
              NoTabela.StateIndex    := 0;
              iOldCodTable := CdsTabCampo.FieldByName( 'IDDDTABLE' ).AsInteger;
              LstIdTabCampo.Add( 'T' + CdsTabCampo.FieldByName( 'IDDDTABLE' ).AsString );
           End;

           NoFilho := TreeDataDic.Items.AddChild( NoTabela, CdsTabCampo.FieldByName( 'FIELDALIAS' ).AsString );
           NoFilho.ImageIndex    := 1;
           NoFilho.SelectedIndex := 1;
           NoFilho.StateIndex    := 1;
           LstIdTabCampo.Add( 'C' + CdsTabCampo.FieldByName( 'IDDDFIELD' ).AsString );
           CdsTabCampo.Next;
    End;

    CdsTabCampo.Close;
    Application.ProcessMessages;
    FrmAguardeDDic.Close;
    bArvoreMotada := True;
  End;
end;

procedure TFrmDataDic.FormDestroy(Sender: TObject);
begin
  inherited;
  LstIdTabCampo.Free;
  DdTable.Free;
  DdField.Free;
end;

procedure TFrmDataDic.FormActivate(Sender: TObject);
begin
  inherited;
  iOldIndex := -1;
end;

procedure TFrmDataDic.TreeDataDicClick(Sender: TObject);
begin
  inherited;
  NtbTabFields.PageIndex := TreeDataDic.Selected.ImageIndex;
  Screen.Cursor := CrHourGlass;

  If iOldIndex <> TreeDataDic.Selected.AbsoluteIndex Then Begin
     If CdsDetTabela.Active Then
        CdsDetTabela.Close;

     If CdsDetCampo.Active Then
        CdsDetCampo.Close;

     Case NtbTabFields.PageIndex Of
          0: Begin  //Tabelas
             CdsDetTabela.Data := DdTable.ListaDdTable( StrToInt( Copy( LstIdTabCampo[ TreeDataDic.Selected.AbsoluteIndex ], 2, Length( LstIdTabCampo[ TreeDataDic.Selected.AbsoluteIndex ] ) ) ) );
          End;

          1: Begin  //Campos
             CdsDetCampo.Data  := DdField.ListaDdField( StrToInt( Copy( LstIdTabCampo[ TreeDataDic.Selected.AbsoluteIndex ], 2, Length( LstIdTabCampo[ TreeDataDic.Selected.AbsoluteIndex ] ) ) ) );
          End;
       End;

       iOldIndex := TreeDataDic.Selected.AbsoluteIndex
  End;

  Screen.Cursor := CrDefault;
end;

procedure TFrmDataDic.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmDataDic.TreeDataDicChange(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;
  If bArvoreMotada Then
     TreeDataDicClick( Self );
end;

procedure TFrmDataDic.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  If MsTabelas.Executar = MrOk Then Begin
     bArvoreMotada := False;
     TreeDataDic.FullCollapse;
     TreeDataDic.Items.Item[ LstIdTabCampo.IndexOf( 'T' +  MsTabelas.ValoresChave[ 0 ] ) ].Selected := True;
     TreeDataDicClick( Self );
     TreeDataDic.Selected.Expand( True );
     TreeDataDic.SetFocus;
     bArvoreMotada := True;
  End;
end;

procedure TFrmDataDic.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  If MsCampos.Executar = MrOk Then Begin
     bArvoreMotada := False;
     TreeDataDic.FullCollapse;
     TreeDataDic.Items.Item[ LstIdTabCampo.IndexOf( 'C' + MsCampos.ValoresChave[ 1 ] ) ].Selected := True;
     TreeDataDicClick( Self );
     TreeDataDic.SetFocus;
     bArvoreMotada := True;
  End;
end;

end.
