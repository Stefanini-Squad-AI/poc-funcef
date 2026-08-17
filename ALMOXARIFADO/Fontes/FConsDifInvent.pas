unit FConsDifInvent;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Grids, Wwdbigrd, Wwdbgrid, Buttons, StdCtrls,
  ComCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97, ExtCtrls,
  Db, Wwdatsrc, DBTables, Wwquery, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TFrmConsDifInvent = class(TfrmSairAjuda)
    Pg: TPageControl;
    TbConsulta: TTabSheet;
    TbResult: TTabSheet;
    grpPeriodo: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edDataI: TCMDateTimePicker;
    EdDataF: TCMDateTimePicker;
    plnTransf: TPanel;
    btnAdiciona: TSpeedButton;
    BtnRemove: TSpeedButton;
    Panel1: TPanel;
    GrdSel: TwwDBGrid;
    GrdTodos: TwwDBGrid;
    updSel: TUpdateSQL;
    qrySel: TwwQuery;
    dsSel: TwwDataSource;
    updAlmox: TUpdateSQL;
    qryAlmox: TwwQuery;
    dsAlmox: TwwDataSource;
    GrdResult: TwwDBGrid;
    plntot: TPanel;
    Label9: TLabel;
    LbTotDif: TLabel;
    qryArtigo: TwwQuery;
    Artigo: TLabel;
    dblcArt: TwwDBLookupCombo;
    qrySelCODALMOXARIFADO: TFloatField;
    qrySelDESCALMOX: TStringField;
    BtnLimpar: TBitBtn;
    qryResult: TwwQuery;
    dsResult: TwwDataSource;
    BtnSel: TBitBtn;
    LbArt: TLabel;
    qryResultCODALMOXARIFADO: TFloatField;
    qryResultDESCALMOX: TStringField;
    qryResultDIF: TFloatField;
    procedure btnAdicionaClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnSelClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
  private
    { Private declarations }
   Procedure FazConsulta;
  public
    { Public declarations }
  end;

var
  FrmConsDifInvent: TFrmConsDifInvent;

implementation

{$R *.DFM}
Uses uMensErro;

procedure TFrmConsDifInvent.btnAdicionaClick(Sender: TObject);
begin
  inherited;
  If Not qryAlmox.IsEmpty Then
     Begin
        With qrySel Do
           Begin
              Append;
              FieldByName('CODALMOXARIFADO').asInteger := qryAlmox.FieldByName('CODALMOXARIFADO').asInteger;
              FieldByName('DESCALMOX').asString        := qryAlmox.FieldByName('DESCALMOX').asString;
            End;
        qryAlmox.Delete;
     End;
end;

procedure TFrmConsDifInvent.BtnRemoveClick(Sender: TObject);
begin
  inherited;
     If Not qrySel.IsEmpty Then
       Begin
          With qryAlmox Do
             Begin
               Append;
               FieldByName('CODALMOXARIFADO').asInteger := qrySel.FieldByName('CODALMOXARIFADO').asInteger;
               FieldByName('DESCALMOX').asString        := qrySel.FieldByName('DESCALMOX').asString;
             End;
          qrySel.Delete;
       End;
end;

procedure TFrmConsDifInvent.FormCreate(Sender: TObject);
begin
  inherited;
  qryAlmox.Open;
  qrySel.Open;
  qryArtigo.Open;
  Pg.ActivePage := TbConsulta;  
end;

Procedure TFrmConsDifInvent.FazConsulta;
Var
  slistAlmox : String;
  rTotDif    : Double;
Begin
    rTotDif := 0;
    // Monta a Clausula IN com os códigos dos almoxarifado
    sListAlmox := '(';
    qrySel.First;
    While Not qrySel.EOF Do
        Begin
            sListAlmox := sListAlmox + IntToStr(qrySel.FieldByName('CODALMOXARIFADO').AsInteger) + ',';
            qrySel.Next;
        End;
    Delete(sListAlmox,Length(sListAlmox),1);
    sListAlmox := sListAlmox + ')';

    With qryResult Do
       Begin
          Close;
          Sql.Clear;
          Sql.Add(' SELECT                                                        ');
          Sql.Add('      I.CODALMOXARIFADO,                                       ');
          Sql.Add('      A.DESCALMOX,                                             ');
          Sql.Add('      SUM(R.DIFERENCAATUAL) AS DIF                             ');
          Sql.Add(' FROM                                                          ');
          Sql.Add('     RESCONT R,                                                ');
          Sql.Add('     INVENTAR I,                                               ');
          Sql.Add('     ALMOX A                                                   ');
          Sql.Add(' WHERE                                                         ');
          Sql.Add('       (I.DATAINVENTARIO >= TO_DATE('''+edDataI.Text+''',''DD/MM/YYYY''))  ');
          Sql.Add('   AND (I.DATAINVENTARIO <= TO_DATE('''+edDataF.Text+''',''DD/MM/YYYY''))  ');
          Sql.Add('   AND (I.CODALMOXARIFADO IN '+sListAlmox+' )                            ');
          Sql.Add('   AND (I.CODALMOXARIFADO = A.CODALMOXARIFADO)                 ');
          Sql.Add('   AND (I.IDINVENTARIO = R.IDINVENTARIO)                       ');
          Sql.Add('   AND (R.DIFERENCAATUAL IS NOT NULL)                          ');
          Sql.Add('   AND (R.DIFERENCAATUAL <> 0 )                                ');
          Sql.Add('   AND (RTRIM(R.CODARTIGO) = '''+Trim(dblcArt.LookupValue)+''')                         ');
          Sql.Add(' GROUP BY  I.CODALMOXARIFADO,A.DESCALMOX                       ');
          Open;
          //
          If Not IsEmpty Then
             Begin
                DisableControls;
                First;
                While Not Eof Do
                  Begin
                      rTotDif := rTotDif + FieldByName('DIF').asFloat;
                      Next;
                  End;
                EnableControls;
             End;
         lbTotDif.Caption := Format('%15.4f',[rTotDif]);
         lbArt.Caption    := dblcArt.Text;
       End;
End;

procedure TFrmConsDifInvent.BtnSelClick(Sender: TObject);
begin
  inherited;
  If Trim(edDataI.Text) = '' Then
     Begin
        MsgDlg('Data de início não preenchida','Erro',mtError,[mbOk],0);
        edDataI.SetFocus;
     End
  Else
  If Trim(edDataF.Text) = '' Then
     Begin
        MsgDlg('Data final não preenchida','Erro',mtError,[mbOk],0);
        edDataF.SetFocus;
     End
  Else
  If edDataI.Date > edDataF.Date Then
     Begin
        MsgDlg('Data de início não pode ser maior que a data final','Erro',mtError,[mbOk],0);
        edDataI.SetFocus;
     End
  Else
  If Trim(dblcArt.Text) = '' Then
     Begin
        MsgDlg('Artigo não preenchido','Erro',mtError,[mbOk],0);
        dblcArt.SetFocus;
     End
  Else
  If qrySel.IsEmpty Then
     Begin
        MsgDlg('Não há nenhum almoxarifado selecionado','Erro',mtError,[mbOk],0);
     End
  Else
     Begin
        FazConsulta;
        Pg.ActivePage := TbResult;
     End;

end;

procedure TFrmConsDifInvent.BtnLimparClick(Sender: TObject);
begin
  inherited;
  edDataI.Text := '';
  edDataF.Text := '';
  qrySel.Close;
  qrySel.Open;
  qryAlmox.Close;
  qryAlmox.Open;
  dblcArt.Text   := '';
  lbArt.Caption  := '';
  qryResult.Close;
  lbTotDif.Caption := ''; 
  Pg.ActivePage := TbConsulta;
end;

end.
