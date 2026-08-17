unit FTesteGeral;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Mask, wwdbedit,
  TREdit, ComCtrls, wwriched, IvDictio, IvMulti, IvEMulti, wwdblook,
  fcColorCombo, fcCombo, CmEventosCadastro, ImgList;

type
  TfrmTesteGeral = class(TfrmCadastroCS)
    qryIDLANCIMOVEL: TFloatField;
    qryRECPAG: TStringField;
    lblContab: TLabel;
    lblCAPCAR: TLabel;
    lblGestao: TLabel;
    lblAtivo: TLabel;
    ImagemSobre: TImage;
    RealEdit1: TRealEdit;
    Button3: TButton;
    wwDBRichEdit1: TwwDBRichEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    qryX: TwwQuery;
    cbo: TwwDBLookupCombo;
    edt: TEdit;
    BitBtn3: TBitBtn;
    Image1: TImage;
    sdfgsgh: TButton;
    Label1: TLabel;
    lblRandom: TLabel;
    edtNumDocumento: TEdit;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    ColorDialog1: TColorDialog;
    fcColorCombo1: TfcColorCombo;
    Button4: TButton;
    Edit2: TEdit;
    Button5: TButton;

    // procedimentos definidos
    function IntervaloDias(dDataIni, dDataFim: TDateTime): smallint;

    procedure Aleatorio;
    Procedure CmeCadastroConfirma(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure fcColorCombo1Change(Sender: TObject);
    procedure Button5Click(Sender: TObject);


  private { Private declarations }

  public { Public declarations }

  end;



var
  frmTesteGeral: TfrmTesteGeral;



implementation
{$R *.DFM}
Uses
  USistema, UMensErro, UDatabase, DBaseDados, uComunsImobiliario, uVerificaPreenchimento, uIntegraBack, UData;



function TfrmTesteGeral.IntervaloDias(dDataIni, dDataFim: TDateTime): smallint;
begin
   Result := -1;

   if dDataFim >= dDataIni then Result := trunc(dDataFim) - trunc(dDataIni);
end;



procedure TfrmTesteGeral.Aleatorio;
var
  i : integer;
begin
   Randomize;
   i := Random(100);
   lblRandom.Caption := IntToStr(i);
end;



procedure TfrmTesteGeral.CmeCadastroConfirma(Sender: TObject);
begin
   // incrementa o identificador do lançamento
   qry.FieldByName('IDLANCIMOVEL').asInteger       := LeUltRegistro(nil, 'LANCAMENTOSIMOVEL');

   inherited;
end;



procedure TfrmTesteGeral.Button3Click(Sender: TObject);
begin
   inherited;
   RealEdit1.Value := high(integer);
end;



procedure TfrmTesteGeral.BitBtn1Click(Sender: TObject);
begin
   inherited;
   WITH wwDBRichEdit1 DO BEGIN

      LINES.ADD('A,SDJBFAKLJSDFKLAJSDFLJKASDHFLKJASD');
      FONT.COLOR := CLRED;
      LINES.ADD('A,SDJBFAKLJSDFKLAJSDFLJKASDHFLKJASD');
      FONT.COLOR := CLBLACK;
      LINES.ADD('A,SDJBFAKLJSDFKLAJSDFLJKASDHFLKJASD');
   END;
end;



procedure TfrmTesteGeral.BitBtn2Click(Sender: TObject);
begin
   inherited;
   MessageDlg('Mensagem de Teste'+#13+#10+'Mensagem de Teste'+#13+#10+''+#13+#10+'Mensagem de Teste'+#13+#10+''+#13+#10+'Mensagem de Teste',mtError,[mbYes,mbNo,mbOK,mbCancel,mbAbort,mbRetry,mbIgnore,mbAll,mbNoToAll],0);
end;



procedure TfrmTesteGeral.BitBtn3Click(Sender: TObject);
begin
   edt.Text := cbo.LookupValue;
end;



procedure TfrmTesteGeral.Button1Click(Sender: TObject);
var
   s: string;
begin
   inherited;

   s := ' ';
end;



procedure TfrmTesteGeral.Button2Click(Sender: TObject);
begin
   inherited;
   ColorDialog1.Execute;
   Edit1.Text := ColorToString(ColorDialog1.Color);
end;



procedure TfrmTesteGeral.fcColorCombo1Change(Sender: TObject);
begin
   inherited;
   Edit1.Text := ColorToString(fcColorCombo1.SelectedColor);
end;



procedure TfrmTesteGeral.Button5Click(Sender: TObject);
begin
   inherited;
   edit2.text := trim(IntegraBack.MascaraPlano) + ';0;_';
end;



end.
