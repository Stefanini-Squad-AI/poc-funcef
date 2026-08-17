unit fData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, StdCtrls, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmData = class(TfrmOkCancelar)
    edData: TCMDateTimePicker;
    Label1: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmData: TfrmData;

implementation

{$R *.DFM}

Uses fMarcaRecPag, uMensErro;

procedure TfrmData.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if trim(edData.Text) = '' then begin
     MsgDlg('Obrigatório Preencher a Data','Erro',mtError,[mbOK],0);
     edData.SetFocus;
     exit;
  end;
  with frmMarcaRecPag.qryAbertoCAR do begin
     First;
     While not EOF do begin
        if FieldByName('FLGCONFIRMARECPAG').AsString = 'S' then begin
           Edit;
           FieldByName('DATAPROGRAMADA').AsString := edData.Text;
           Post;
        end;
        Next;
     end;
  end;
  with frmMarcaRecPag.qryAbertoCAP do begin
     First;
     While not EOF do begin
        if FieldByName('FLGCONFIRMARECPAG').AsString = 'S' then begin
           Edit;
           FieldByName('DATAPROGRAMADA').AsString := edData.Text;
           Post;
        end;
        Next;
     end;
  end;
  bbtnSair.Click;
end;

end.
