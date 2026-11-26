// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 26.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FCtrlInterface;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Db, DBTables,
  Wwquery, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, TB97Tlbr, IvDictio,
  IvMulti, IvEMulti;

type
  TfrmCtrlinterface = class(TfrmSairAjuda)
    pnlTitulos: TPanel;
    StaticText1: TStaticText;
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    grplegenda: TGroupBox;
    Shape4: TShape;
    Label11: TLabel;
    Shape5: TShape;
    Shape6: TShape;
    Label14: TLabel;
    Label12: TLabel;
    Shape1: TShape;
    Label16: TLabel;
    dbgrdPatro: TwwDBGrid;
    wwDBGrid1: TwwDBGrid;
    dsPatro: TwwDataSource;
    qryPatro: TwwQuery;
    dsAssist: TwwDataSource;
    qryAssist: TwwQuery;
    CheckBox1: TCheckBox;
    qryAssistIDLOTE: TFloatField;
    qryAssistFLGIDATMP: TFloatField;
    qryAssistIDPESSOA: TFloatField;
    qryAssistFLGVOLTATMP: TFloatField;
    qryAssistFLGIDAINTERFACE: TFloatField;
    qryAssistFLGVOLTAINTERFACE: TFloatField;
    qryAssistFLGEMITIUCC: TFloatField;
    qryAssistDATAIDATMP: TDateTimeField;
    qryAssistDATAVOLTATMP: TDateTimeField;
    qryAssistDATAIDAINTERFACE: TDateTimeField;
    qryAssistDATAEMITIUCC: TDateTimeField;
    qryAssistNUMREG: TFloatField;
    qryAssistVLRTOTAL: TFloatField;
    qryAssistMESREFERENCIA: TStringField;
    qryAssistTIPO: TStringField;
    cmbmodulo: TComboBox;
    Label1: TLabel;
    qryAssistFLGPREPARADO: TFloatField;
    qryAssistDATAPREPARO: TDateTimeField;
    qryAssistDESCRICAO: TStringField;
    qryAssistFLGATRASODEVOL: TStringField;
    qryAssistDATAVOLTAINTERFA: TDateTimeField;
    procedure FormActivate(Sender: TObject);
    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure qryPatroAfterScroll(DataSet: TDataSet);
    procedure CheckBox1Click(Sender: TObject);
    procedure qryAssistBeforeOpen(DataSet: TDataSet);
    procedure LeTipo ;
    procedure cmbmoduloChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCtrlinterface: TfrmCtrlinterface;
  sTipo : String;

implementation

uses UAdmPrev;

{$R *.DFM}

procedure TfrmCtrlinterface.LeTipo ;
begin
   case cmbmodulo.itemindex of
      0: sTipo := 'A';
      1: sTipo := 'P';
      2: sTipo := 'E';
      3: sTipo := 'B';
   end;

end;

procedure TfrmCtrlinterface.FormActivate(Sender: TObject);
begin
  inherited;

  cmbmodulo.itemindex := 1;

  qryPatro.Close;
  qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryPatro.Open;


  qryassist.open;
end;

procedure TfrmCtrlinterface.wwDBGrid1CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;

if CheckBox1.checked then
begin
  if (qryAssist.FieldByName('FLGVOLTATMP').AsString = '1' )
  then begin //já foi recebido
     ABrush.Color := clWhite;
     AFont.Color  := clWindowText;
  end
  else if (qryAssist.FieldByName('FLGVOLTAINTERFACE').AsString = '1' )
  then begin //já voltou do sistema de cobrança, e esta disponível na tmpdesc
     ABrush.Color := $00CAFFFF;
     AFont.Color  := clWindowText;
  end
  else if (qryAssist.FieldByName('FLGIDAINTERFACE').AsString = '1' )
  then begin //foi para o sistema de cobrança
     ABrush.Color := clGray;
     AFont.Color  := clWindow;
  end
  else if (qryAssist.FieldByName('FLGIDATMP').AsString = '1' )
  then begin  //foi enviada para a tmpdesc
     ABrush.Color := $00FFFFA4;
     AFont.Color  := clWindowText;
  end;
end;

end;

procedure TfrmCtrlinterface.qryPatroAfterScroll(DataSet: TDataSet);
begin
  inherited;
  wwDBGrid1.ApplySelected;
  LeTipo ;
  qryassist.close;
  qryassist.open;
end;

procedure TfrmCtrlinterface.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if CheckBox1.checked then
    grplegenda.visible := true
  else  
    grplegenda.visible := false ;

  LeTipo ;
  qryassist.close;
  qryassist.open;

end;

procedure TfrmCtrlinterface.qryAssistBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryassist.parambyname('idpessoa').AsString := qrypatro.fieldbyname('idpessoa').AsString;
  qryassist.parambyname('tipo').AsString := sTipo;
end;

procedure TfrmCtrlinterface.cmbmoduloChange(Sender: TObject);
begin
  inherited;
  LeTipo ;
  qryassist.close;
  qryassist.open;
end;

end.
