unit fAssistenteRelatsMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FPAI, Db, DBClient, MontaSelect, Wwdatsrc, TreeWzd, StdCtrls, DBCtrls,
  wwdblook, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Buttons, IvDictio,
  IvMulti, IvEMulti;

type
  TFrmAssistenteRelatsMT = class(TfrmPai)
    NtbAssist: TNotebook;
    Bevel1: TBevel;
    BtnEtiq: TSpeedButton;
    BtnLista: TSpeedButton;
    BtnColunas: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    SbPesquisa: TSpeedButton;
    EdtCons: TEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    Bevel2: TBevel;
    Label4: TLabel;
    Label6: TLabel;
    CmbCampo: TComboBox;
    EdtTipo: TEdit;
    BtnInclui: TBitBtn;
    BtnExclui: TBitBtn;
    BtnPesquisa: TBitBtn;
    wwDBGrid1: TwwDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    LstGrupo: TListBox;
    BtnUp: TBitBtn;
    BtnDow: TBitBtn;
    Panel5: TPanel;
    Panel6: TPanel;
    RadioGroup1: TRadioGroup;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Bevel3: TBevel;
    Label9: TLabel;
    Label5: TLabel;
    CmbModulo: TwwDBLookupCombo;
    ChkFiltro: TDBCheckBox;
    EdtNomeRelat: TEdit;
    MemDescRelats: TMemo;
    wwDBLookupCombo1: TwwDBLookupCombo;
    TwCons: TTreeWzd;
    BtnAnterior: TBitBtn;
    BtnProximo: TBitBtn;
    BtnCancela: TBitBtn;
    BtnEncerra: TBitBtn;
    ColorDlg: TColorDialog;
    DlgFile: TSaveDialog;
    DsFields: TwwDataSource;
    MsConsulta: TMontaSelect;
    CdsFields: TClientDataSet;
    CdsAux: TClientDataSet;
    CdsConsultas: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAssistenteRelatsMT: TFrmAssistenteRelatsMT;

implementation

{$R *.DFM}

end.
