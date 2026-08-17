unit FDocReceberMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Wwdatsrc, Grids,
  Wwdbigrd, CMProcuraSubTipo, wwdbdatetimepicker, CMDateTimePicker,
  Wwdbgrid, TREdit;

type
  TfrmDocReceberMT = class(TfrmOkCancelar)
    dbgrDocRec: TwwDBGrid;
    cmpcfCliente: TCMProcuraForCli;
    bbtnFiltra: TBitBtn;
    gbFaixaDatas: TGroupBox;
    edDataIni: TCMDateTimePicker;
    edDataFim: TCMDateTimePicker;
    GroupBox1: TGroupBox;
    edtFaixaIni: TDBRealEdit;
    edtFaixaFim: TDBRealEdit;
    rdgOrdenarPor: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnFiltraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDocReceberMT: TfrmDocReceberMT;

implementation

Uses FEfetivacaoMT;

{$R *.DFM}

procedure TfrmDocReceberMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  //
end;
//************************************************
Procedure TfrmDocReceberMT.bbtnFiltraClick(Sender: TObject);
Begin
  Inherited;

  Cursor := crSQLWait;
  With frmEfetivacaoMT.cdsDocRec Do Begin
    Close;
    Data := frmEfetivacaoMT.CtrlEfetivacao.FiltraDocRec( Trim( edDataIni.Text ),
                                                         Trim( edDataFim.Text ),
                                                         cmpcfCliente.ForCliReg.Id,
                                                         edtFaixaIni.Value,
                                                         edtFaixaFim.Value,
                                                         rdgOrdenarPor.ItemIndex );
    Open;

  End;
  Cursor := crDefault;
End;
//************************************************
End.
