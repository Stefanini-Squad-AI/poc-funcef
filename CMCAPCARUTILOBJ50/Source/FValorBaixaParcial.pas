{ Rotina........: TfrmVlrParcial.bbtnOkClick
N. Sol..........: 109609
N. Kintana......: 498009
Data............: 07/04/2009
Responsável.....: Marilza Colpani
Descrição.......: Retirado a função input e criado este formulário para substituí-lo.
                  Não permitir que o total da baixa do documento e/ou documentos
                seja superior ao total do valor do documento e/ou documentos.
********************************************************}

unit FValorBaixaParcial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TREdit, Buttons;

type
  TfrmValorBaixaParcial = class(TForm)
    lbl1: TLabel;
    edtValor: TRealEdit;
    bbtnCancelar: TBitBtn;
    bbtnOk: TBitBtn;
    procedure bbtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    FValorDocumento : Double;
    { Private declarations }
  public
    { Public declarations }
    property ValorDocumento : Double read FValorDocumento write FValorDocumento;

  end;

var
  frmValorBaixaParcial: TfrmValorBaixaParcial;

implementation
  uses
  uCMDialogs,FBaixaManualMT;

{$R *.DFM}

procedure TfrmValorBaixaParcial.bbtnOkClick(Sender: TObject);
Var
  bInsereDoc : Boolean;
  rValue: Double;
begin
  //Marilza Colpani 07/04/2009 N.Sol 109609/N.Kintana 498009
  //Alterado a estrutura das verificações
   bInsereDoc := False;
   if edtValor.Value <= 0  then
     begin
       bInsereDoc := False;
       Msgdlg('O Valor do Pago é menor ou menor que zero','Atenção!',mtInformation,[mbOk],0);
       edtValor.Value := FValorDocumento;
     end
   else
     if edtValor.Value > FValorDocumento then
       begin
         bInsereDoc := False;
         Msgdlg(' Valor da baixa parcial do documento não pode ser maior que o valor do documento ','Atenção!',mtInformation,[mbOk],0);
         edtValor.Value := FValorDocumento;
       end
     else
       if edtValor.Value <= FValorDocumento then
          begin
            bInsereDoc := True;

            rValue := edtValor.Value;
          end;

   if bInsereDoc then
     ModalResult := mrOk;

end;

procedure TfrmValorBaixaParcial.FormShow(Sender: TObject);
begin
  bbtnOk.SetFocus;
end;

procedure TfrmValorBaixaParcial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 //Marilza Colpani 07/04/2009 N.Sol 109609/N.Kintana 498009
 //Passando o valor obtido neste formulário para o FrmBaixaManualMT
  FrmBaixaManualMT.rValue := edtValor.Value;
  frmValorBaixaParcial := nil;
  action := CaFree;
end;

procedure TfrmValorBaixaParcial.FormDestroy(Sender: TObject);
begin
  FreeAndNil(frmValorBaixaParcial);
end;

end.
