unit FConsCargoFuncao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, Mask, DBCtrls, wwdblook,
  ComCtrls, DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid, TREdit,
  MontaSelect, wwdbedit, Wwdbspin;

type
  TfrmConsCargoFuncao = class(TfrmSairAjuda)
    pgctrlCargoFuncao: TPageControl;
    tbsCargo: TTabSheet;
    tbsFuncoes: TTabSheet;
    pnlFuncao: TPanel;
    GroupBox1: TGroupBox;
    dbedFuncao: TDBEdit;
    Label2: TLabel;
    dsFuncao: TwwDataSource;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    qryOutrosGrupos: TwwQuery;
    dsOutrosGrupos: TwwDataSource;
    qryFuncoesCorresp: TwwQuery;
    wwDBGrid1: TwwDBGrid;
    dsFuncoesCorresp: TwwDataSource;
    qryAux: TwwQuery;
    dsCargo: TwwDataSource;
    pnlCargo: TPanel;
    GroupBox4: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    reValorCargo: TRealEdit;
    DBEdit10: TDBEdit;
    GroupBox5: TGroupBox;
    dbgrdCargo: TwwDBGrid;
    GroupBox6: TGroupBox;
    dbgrdNivelCargo: TwwDBGrid;
    dsCargoExtXPess: TwwDataSource;
    qryCargoExtXPess: TwwQuery;
    dsNivelCargo: TwwDataSource;
    qryNivelCargo: TwwQuery;
    DBRadioGroup1: TDBRadioGroup;
    qryNivelCargoCODIGO: TStringField;
    qryNivelCargoDATAEFETIVACAO: TDateTimeField;
    qryNivelCargoVALOR: TFloatField;
    Label10: TLabel;
    DBEdit7: TDBEdit;
    bbtnProcFuncao: TBitBtn;
    MSFuncao: TMontaSelect;
    bbtnProcCargo: TBitBtn;
    MSCargo: TMontaSelect;
    Label16: TLabel;
    dbspedJornada: TwwDBSpinEdit;
    Label17: TLabel;
    Label18: TLabel;
    DBEdit11: TDBEdit;
    Label1: TLabel;
    Label7: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    pgCtrlOutrosGrupos: TPageControl;
    tbsValores: TTabSheet;
    tbsHistorico: TTabSheet;
    dbgrdOutrasFuncoes: TwwDBGrid;
    wwDBGrid2: TwwDBGrid;
    dsHistGrupo: TwwDataSource;
    qryHistGrupo: TwwQuery;
    qryOutrosGruposCODGRUPO: TStringField;
    qryOutrosGruposNOMEGRUPO: TStringField;
    qryOutrosGruposDATAVALOR: TDateTimeField;
    qryOutrosGruposVALORPCC: TFloatField;
    qryOutrosGruposVALORNAOPCC: TFloatField;
    DBEdit13: TDBEdit;
    qryOutrosGruposACABOU: TFloatField;
    edtCodGrpAtual: TEdit;
    edtNomeGrpAtual: TEdit;
    Label14: TLabel;
    GroupBox7: TGroupBox;
    Label6: TLabel;
    reValorAtual: TRealEdit;
    edtPisoMercado: TRealEdit;
    Label15: TLabel;
    edtPisoMercadoLic: TRealEdit;
    Label19: TLabel;
    qryOutrosGruposPISOMERCADO: TFloatField;
    qryOutrosGruposPISOMERCADOLIC: TFloatField;
    qryFuncao: TwwQuery;
    qryCargo: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure qryFuncaoAfterScroll(DataSet: TDataSet);
    procedure qryCargoAfterScroll(DataSet: TDataSet);
    procedure dblkpcmbCargoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbFuncaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnProcFuncaoClick(Sender: TObject);
    procedure bbtnProcCargoClick(Sender: TObject);
    procedure dbgrdOutrasFuncoesCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
  private
    { Private declarations }
    procedure AtualizaDadosCargo;
    procedure AtualizaDadosFuncao;
  public
    { Public declarations }
  end;

var
  frmConsCargoFuncao: TfrmConsCargoFuncao;

implementation

uses FPrincipal, UPCS, DAPrev;

{$R *.DFM}

procedure TfrmConsCargoFuncao.AtualizaDadosCargo;
var dValorCargo : double;
begin

  if (not qryCargo.Active) then Exit;

  dValorCargo := BuscaValorCARGO( frmPrincipal.liIdPessJurPCS,
                                  qryCargo.FieldByName('IdCargoExt').AsInteger,
                                  qryCargo.FieldByName('DataVigencia').AsString,
                                  DateToStr(date));

  with qryNivelCargo do
  begin
    Close;
    ParamByName('IdPessJur').AsInteger    := frmPrincipal.liIdPessJurPCS;
    ParamByName('IdCargoExt').AsInteger   := qryCargo.FieldByName('IdCargoExt').AsInteger;
    Open;
  end;

  If qryCargo.FieldByName('IdCargoExt').AsString <> '' Then
  Begin
    with qryAux do
    begin
      Sql.Clear;
      Sql.Add(' SELECT COUNT(*) QUANTIDADE '+
              ' FROM   NIVEL N, CARGOXNIVEL CN '+
              ' WHERE  CN.IDPESSJUR  = '+ IntToStr(frmPrincipal.liIdPessJurPCS) +
              ' AND    CN.IDCARGOEXT = '+ qryCargo.FieldByName('IdCargoExt').AsString+
              ' AND    N.IDNIVEL     = CN.IDNIVEL '+
              ' AND    N.IDPESSJUR = CN.IDPESSJUR ');
      Open;
      
      If FieldByName('QUANTIDADE').AsInteger <> 1 Then
        reValorCargo.Clear
      Else reValorCargo.Value := dValorCargo;
      Close;
    end; 
  End;

  with qryCargoExtXPess do
  begin
     Close;
     ParamByName('IdPessJur').AsInteger    := frmPrincipal.liIdPessJurPCS;
     ParamByName('IdCargoExt').AsInteger   := qryCargo.FieldByName('IdCargoExt').AsInteger;
     Open;
  end;
end;

procedure TfrmConsCargoFuncao.AtualizaDadosFuncao;
var dValorFuncao : double;
    lsCargo: String;
begin
  if (not qryFuncao.Active) then Exit;

  dValorFuncao            := BuscaValorFUNCAO( frmPrincipal.liIdPessJurPCS,
                                               qryFuncao.FieldByName('IdCargoExt').AsInteger,
                                               DateToStr(date) );
  reValorAtual.Value      := dValorFuncao;

  edtPisoMercado.Value    := BuscaValoresGrupoFUNCAO( frmPrincipal.liIdPessJurPCS,
                                                      qryFuncao.FieldByName('IdCargoExt').AsInteger,
                                                      DateToStr(date) ).PisoMercado;

  edtPisoMercadoLic.Value := BuscaValoresGrupoFUNCAO( frmPrincipal.liIdPessJurPCS,
                                                      qryFuncao.FieldByName('IdCargoExt').AsInteger,
                                                      DateToStr(date) ).PisoMercadoLic;

  
  // verificar se qryAux está sendo utilizada neste momento...
  If qryFuncao.FieldByName('IdCargoExt').IsNull Then
    lsCargo :=  '-1'
  Else lsCargo := qryFuncao.FieldByName('IdCargoExt').AsString;

  with qryAux do
  Begin
    Sql.Clear;
    Sql.Add(' SELECT GF.CODIGO, GF.NOME FROM GRUPOFUNC GF '+
            ' WHERE GF.IDPESSJUR = '+IntToStr(frmPrincipal.liIdPessJurPCS)+
            '   AND GF.IDGRUPOFUNC IN (SELECT IDGRUPOFUNC FROM GRUPOCARGOEXT GCE'+
            '                         WHERE GCE.IDPESSJUR = GF.IDPESSJUR '+
            '                           AND GCE.IDCARGOEXT = '+lsCargo+
            '                           AND GCE.DATAVIGENCIA = ( SELECT MAX(DATAVIGENCIA) '+
            '                                                    FROM GRUPOCARGOEXT       '+
            '                                                    WHERE  IDPESSJUR      =  '+IntToStr(frmPrincipal.liIdPessJurPCS)+
            '                                                    AND    IDCARGOEXT     =  '+lsCargo+
            '                                                    AND    DATAVIGENCIA   <= TO_DATE('''+DateToStr(date)+''',''DD/MM/YYYY'')      '+
            '                                                    AND    ((DATAFIM      >= TO_DATE('''+DateToStr(date)+''',''DD/MM/YYYY'') ) OR '+
            '                                                        (DATAFIM      IS NULL) ) ) )');
    Open;
    If Not IsEmpty Then
    Begin
      edtCodGrpAtual.Text := FieldByName('CODIGO').AsString;
      edtNomeGrpAtual.Text := FieldByName('NOME').AsString;
      Close;
    End Else
    Begin
      edtCodGrpAtual.Clear;
      edtNomeGrpAtual.Clear;
    End;
  End;

  with qryOutrosGrupos do
  begin
     Close;
     ParamByName('IdPessJur').AsInteger  := frmPrincipal.liIdPessJurPCS;
     ParamByName('IdCargoExt').AsInteger := qryFuncao.FieldByName('IdCargoExt').AsInteger;
     Open;
  end;

  with qryHistGrupo do
  begin
     Close;
     ParamByName('IdPessJur').AsInteger  := frmPrincipal.liIdPessJurPCS;
     ParamByName('IdCargoExt').AsInteger := qryFuncao.FieldByName('IdCargoExt').AsInteger;
     Open;
  end;

  // Esta query traz 3 subquerys, que retornam 3 tipos de correspondencia diferentes
  // SubQuery1 : Traz a Funcao Correspondente na propria fundacao
  // SubQuery2 : Traz a Funcao Correspondente na patrocinadora pelo codigo
  //             Caso não haja, traz quem é a funcao na patrocinadora com o mesmo nome
  // SubQuery3 : Traz quem é a funcao da subquery2 na funcef
  qryFuncoesCorresp.Close;
  qryFuncoesCorresp.ParamByName('IDPESSJUR').AsInteger := frmPrincipal.liIdPessJurPCS;
  qryFuncoesCorresp.ParamByName('CODIGO').AsString     := Trim(qryFuncao.FieldByName('Codigo').AsString);
  qryFuncoesCorresp.Open;


end;

procedure TfrmConsCargoFuncao.FormShow(Sender: TObject);
begin
  inherited;
  Caption := Caption + ' - Patrocinadora : '+frmPrincipal.sNomePatroPCS;

  pgctrlCargoFuncao.ActivePage := tbsCargo;

  qryFuncao.Close;
  qryFuncao.ParamByName('IdPessJur').AsInteger   := -1;
  qryFuncao.ParamByName('IdCargoExt').AsInteger  := -1;
  qryFuncao.Open;

  qryCargo.Close;
  qryCargo.ParamByName('IdCARGOEXT').AsInteger   := -1;
  qryCargo.ParamByName('IdPessJur').AsInteger    := -1;
  qryCargo.Open;

  qryFuncao.First;
  qryCargo.First; 

  pgCtrlOutrosGrupos.ActivePage := tbsValores;
  
  
  AtualizaDadosFuncao;
end;

procedure TfrmConsCargoFuncao.qryFuncaoAfterScroll(DataSet: TDataSet);
begin
  inherited;

  AtualizaDadosFuncao;
end;

procedure TfrmConsCargoFuncao.qryCargoAfterScroll(DataSet: TDataSet);
begin
   inherited;

   AtualizaDadosCargo;
end;

procedure TfrmConsCargoFuncao.dblkpcmbCargoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  AtualizaDadosCargo;
end;

procedure TfrmConsCargoFuncao.dblkpcmbFuncaoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  AtualizaDadosFuncao;
end;

procedure TfrmConsCargoFuncao.bbtnProcFuncaoClick(Sender: TObject);
begin
  inherited;

  MSFuncao.Filtro.Strings[0] := ' C.IDPESSJUR = '+IntToStr(frmPrincipal.liIdPessJurPCS);
  MSFuncao.Executar;

  if (MSFuncao.ValoresChave.Count > 0) and (MSFuncao.ValoresChave[0] <> '')
  then begin

     qryFuncao.Close;
     qryFuncao.ParamByName('IdPessJur').AsInteger   := frmPrincipal.liIdPessJurPCS;
     qryFuncao.ParamByName('IdCargoExt').AsInteger  := StrToInt(MsFuncao.ValoresChave[1]);
     qryFuncao.Open;

     AtualizaDadosFuncao;
  end
  else begin
     qryFuncao.Close;
     qryFuncao.ParamByName('IdPessJur').AsInteger   := -1;
     qryFuncao.ParamByName('IdCargoExt').AsInteger  := -1;
     qryFuncao.Open;

     AtualizaDadosFuncao;
  end;
end;

procedure TfrmConsCargoFuncao.bbtnProcCargoClick(Sender: TObject);
begin
  inherited;
  MSCargo.Filtro.Strings[0] := ' C.IDPESSJUR = '+IntToStr(frmPrincipal.liIdPessJurPCS);
  MSCargo.Executar;

  if (MSCargo.ValoresChave.Count > 0) and (MSCargo.ValoresChave[0] <> '')
  then begin
     qryCargo.Close;
     qryCargo.ParamByName('IdPessJur').AsInteger   := frmPrincipal.liIdPessJurPCS;
     qryCargo.ParamByName('IdCARGOEXT').AsInteger  := StrToInt(MsCargo.ValoresChave[1]);
     qryCargo.Open;
  end
  else begin
     qryCargo.Close;
     qryCargo.ParamByName('IdPessJur').AsInteger   := -1;
     qryCargo.ParamByName('IdCARGOEXT').AsInteger  := -1;
     qryCargo.Open;
  end;
  AtualizaDadosCargo;
end;

procedure TfrmConsCargoFuncao.dbgrdOutrasFuncoesCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;

  if qryOutrosGrupos.FieldByName('ACABOU').AsInteger = 1
  then ABrush.Color := clSilver
  else ABrush.Color := clWindow;
  AFont.Color       := clWindowText;
end;

end.


