unit fCadParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroCS,
  wwdbedit, Wwdbspin, StdCtrls, Mask, DBCtrls, IvDictio, IvMulti, IvEMulti, MontaSelect,
  DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97, wwdblook,
  ComCtrls, FCadastro, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro,
  ImgList;

type
  TfrmCadParam = class(TfrmCadastroCS)
    pgctrlPaginas: TPageControl;
    tbshMotivoRubricas: TTabSheet;
    Label16: TLabel;
    LabelFolhaNormal: TLabel;
    dblcMotivo: TwwDBLookupCombo;
    wwDBLookupCombo1: TwwDBLookupCombo;
    tbshDataProc: TTabSheet;
    gbxNormal: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    dbedNorIni: TCMDateTimePicker;
    dbedNorFim: TCMDateTimePicker;
    gbxFerias: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    dbedFerIni: TCMDateTimePicker;
    dbedFerFim: TCMDateTimePicker;
    gbx13Sal: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    dbed13Ini: TCMDateTimePicker;
    dbed13Fim: TCMDateTimePicker;
    tbshPolitSal: TTabSheet;
    Label17: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dbspeQtdSt: TwwDBSpinEdit;
    dbedSt1: TDBEdit;
    dbedSt2: TDBEdit;
    dbedSt3: TDBEdit;
    dbedSt4: TDBEdit;
    dbedSt5: TDBEdit;
    dbedSt6: TDBEdit;
    dbedSt7: TDBEdit;
    dbedSt8: TDBEdit;
    dbedSt9: TDBEdit;
    gbxDoisCargos: TDBRadioGroup;
    dbrgNivelIndiv: TDBRadioGroup;
    qryMotivo: TwwQuery;
    qryRubrica: TwwQuery;
    tbshUsoPessoal: TTabSheet;
    dbrgUsoPessoal: TDBRadioGroup;
    gbxAutor: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    dbcbxInsEnder: TDBCheckBox;
    dbcbxAltEnder: TDBCheckBox;
    dbcbxExcEnder: TDBCheckBox;
    dbcbxInsTelef: TDBCheckBox;
    dbcbxAltTelef: TDBCheckBox;
    dbcbxExcTelef: TDBCheckBox;
    dbcbxInsContt: TDBCheckBox;
    dbcbxAltContt: TDBCheckBox;
    dbcbxExcContt: TDBCheckBox;
    dbcbxInsCurso: TDBCheckBox;
    dbcbxAltCurso: TDBCheckBox;
    dbcbxExcCurso: TDBCheckBox;
    dbcbxInsFeria: TDBCheckBox;
    dbcbxAltFeria: TDBCheckBox;
    dbcbxExcFeria: TDBCheckBox;
    dbcbxEmprgIns: TDBCheckBox;
    dbcbxEmprgAlt: TDBCheckBox;
    dbcbxEmprgExc: TDBCheckBox;
    dbcbxAltCtSal: TDBCheckBox;
    TabSheet1: TTabSheet;
    rgTipDurContr: TDBRadioGroup;
    gbxTamMatric: TGroupBox;
    wwDBSpinEdit1: TwwDBSpinEdit;
    dbrgNumeraMatric: TDBRadioGroup;
    DBRadioGroup1: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure dbspeQtdStChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbrgNumeraMatricChange(Sender: TObject);
  end;

var
  frmCadParam: TfrmCadParam;

implementation

uses uSistema;

{$R *.DFM}

procedure TfrmCadParam.FormCreate(Sender: TObject);
begin
  inherited;
  pgctrlPaginas.ActivePageIndex := 0;
  qry.Open;
  if (qry.IsEmpty) then
  begin
    qry.Insert;
//    qry.FieldByName('NORMALINI').AsString := DateToStr(Date);
//    qry.FieldByName('NORMALFIM').AsString := DateToStr(Date);
    qry.FieldByName('FLGENDERINS').asInteger := 0;
    qry.FieldByName('FLGENDERALT').asInteger := 0;
    qry.FieldByName('FLGENDEREXC').asInteger := 0;
    qry.FieldByName('FLGTELEFINS').asInteger := 0;
    qry.FieldByName('FLGTELEFALT').asInteger := 0;
    qry.FieldByName('FLGTELEFEXC').asInteger := 0;
    qry.FieldByName('FLGCONTTINS').asInteger := 0;
    qry.FieldByName('FLGCONTTALT').asInteger := 0;
    qry.FieldByName('FLGCONTTEXC').asInteger := 0;
    qry.FieldByName('FLGCURSOINS').asInteger := 0;
    qry.FieldByName('FLGCURSOALT').asInteger := 0;
    qry.FieldByName('FLGCURSOEXC').asInteger := 0;
    qry.FieldByName('FLGFERIAINS').asInteger := 0;
    qry.FieldByName('FLGFERIAALT').asInteger := 0;
    qry.FieldByName('FLGFERIAEXC').asInteger := 0;
    qry.FieldByName('FLGEMPRGINS').asInteger := 0;
    qry.FieldByName('FLGEMPRGALT').asInteger := 0;
    qry.FieldByName('FLGEMPRGEXC').asInteger := 0;
    qry.FieldByName('FLGCTSALALT').asInteger := 0; 
    qry.Post;
  end;

  if (qry.FieldByName('NUMSTEPS').IsNull) then
  begin
    qry.Edit;
    qry.FieldByName('NUMSTEPS').asInteger := 9;
    qry.FieldByName('TITSTEP1').asString := 'Step 1';
    qry.FieldByName('TITSTEP2').asString := 'Step 2';
    qry.FieldByName('TITSTEP3').asString := 'Step 3';
    qry.FieldByName('TITSTEP4').asString := 'Step 4';
    qry.FieldByName('TITSTEP5').asString := 'Step 5';
    qry.FieldByName('TITSTEP6').asString := 'Step 6';
    qry.FieldByName('TITSTEP7').asString := 'Step 7';
    qry.FieldByName('TITSTEP8').asString := 'Step 8';
    qry.FieldByName('TITSTEP9').asString := 'Step 9';
    qry.Post;
  end;
  qry.ApplyUpdates;

  qryRubrica.ParamByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
  qryRubrica.Open;
  qryMotivo.Open;
end;

procedure TfrmCadParam.FormShow(Sender: TObject);
begin
  inherited;
  sbtnAlterar.Enabled := not(qry.IsEmpty);
  pnlFundo.Enabled := true;
end;

procedure TfrmCadParam.dbspeQtdStChange(Sender: TObject);
begin
  inherited;
  Label1.Visible  := (dbspeQtdSt.Value >= 1);
  dbedSt1.Visible := (dbspeQtdSt.Value >= 1);
  Label2.Visible  := (dbspeQtdSt.Value >= 2);
  dbedSt2.Visible := (dbspeQtdSt.Value >= 2);
  Label3.Visible  := (dbspeQtdSt.Value >= 3);
  dbedSt3.Visible := (dbspeQtdSt.Value >= 3);
  Label4.Visible  := (dbspeQtdSt.Value >= 4);
  dbedSt4.Visible := (dbspeQtdSt.Value >= 4);
  Label5.Visible  := (dbspeQtdSt.Value >= 5);
  dbedSt5.Visible := (dbspeQtdSt.Value >= 5);
  Label6.Visible  := (dbspeQtdSt.Value >= 6);
  dbedSt6.Visible := (dbspeQtdSt.Value >= 6);
  Label7.Visible  := (dbspeQtdSt.Value >= 7);
  dbedSt7.Visible := (dbspeQtdSt.Value >= 7);
  Label8.Visible  := (dbspeQtdSt.Value >= 8);
  dbedSt8.Visible := (dbspeQtdSt.Value >= 8);
  Label9.Visible  := (dbspeQtdSt.Value >= 9);
  dbedSt9.Visible := (dbspeQtdSt.Value >= 9);
end;

procedure TfrmCadParam.dbrgNumeraMatricChange(Sender: TObject);
begin
  inherited;
  gbxTamMatric.Visible := dbrgNumeraMatric.ItemIndex = 0;
end;

end.
