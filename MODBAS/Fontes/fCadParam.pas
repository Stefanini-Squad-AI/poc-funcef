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
    procedure FormCreate(Sender: TObject);
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
    qry.Post;
  end;

  qry.ApplyUpdates;

end;

procedure TfrmCadParam.FormShow(Sender: TObject);
begin
  inherited;
  sbtnAlterar.Enabled := not(qry.IsEmpty);
  pnlFundo.Enabled := true;
end;

procedure TfrmCadParam.dbrgNumeraMatricChange(Sender: TObject);
begin
  inherited;
  gbxTamMatric.Visible := dbrgNumeraMatric.ItemIndex = 0;
end;

end.
