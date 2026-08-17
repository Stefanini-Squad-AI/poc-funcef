//*******************************************************************************************************
//Data	    : 31/08/2007
//Código    : Al_4
//Pendencia :
//SOL       :
//Motivo(S) : Acerto no SelectNext do bbtnConfirmarClick que tem que ficar antes do  inherited
//********************************************************************************************************
// Data     : 30/08/2007
// Código   : AL_2
// Motivo   : Acerto na criação da VerEmAbertura
//********************************************************************************************************
// Data     : 14/11/2005
// Código   : AL_1
// Motivo   : Controle do processo de abertura
//********************************************************************************************************

unit FCadastroMTInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, fcLabel, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uInvestimento, uCtrlRendaFixa, uCtrlPadroes;

type
  TFrmCadastroMTInv = class(TFrmCadastroMT)
    pnlTitulo: TPanel;
    lbNomItem: TfcLabel;
    CdsAux: TCMClientDataSet;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    CtrlRendaFixa     : TCtrlRendaFixa;
    function VerEmAbertura : boolean;
  public
    { Public declarations }
  end;

var
  FrmCadastroMTInv: TFrmCadastroMTInv;

implementation

//AL_2
uses uMensErro, FPrincipal, uRendaFixa, uRendaVariavel;

{$R *.DFM}

procedure TFrmCadastroMTInv.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then     //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)
end;

procedure TFrmCadastroMTInv.bbtnConfirmarClick(Sender: TObject);
begin
   // Força a saída do componente atual para acionar o OnExit deste componente
   //    no caso de teclar enter e o botão for default
   SelectNext(ActiveControl,True,True);
  inherited;
end;

procedure TFrmCadastroMTInv.sbtnInserirClick(Sender: TObject);
begin
   //AL_2
   if VerEmAbertura then
     Exit;
  inherited;

end;

procedure TFrmCadastroMTInv.sbtnAlterarClick(Sender: TObject);
begin
   //AL_2
   if VerEmAbertura then
     Exit;
  inherited;

end;

procedure TFrmCadastroMTInv.sbtnApagarClick(Sender: TObject);
begin
   //AL_2
   if VerEmAbertura then
     Exit;
  inherited;

end;

function TFrmCadastroMTInv.VerEmAbertura : boolean;
begin
   //AL_2 Ini
   Try
      Result := False;
      // AL_1 - Controle do processo de abertura de renda fixa
      // Se for Renda Fixa
      if TipoMenuInvest = 'F' then
      begin
         begin
            if RendaFixa.VerEmAbertura then
            begin
               CmeCadastro.AtualizaBotoes(Self);
               Result := True;
               Exit;
            end;
         end
      end
      else
      // Se for Renda Variavel
      if TipoMenuInvest = 'V' then
      begin
         if RendaVariavel.VerEmAbertura then
         begin
            CmeCadastro.AtualizaBotoes(Self);
            Result := True;
            Exit;
         end;
      end;
   Finally

   end;
end;

procedure TFrmCadastroMTInv.FormCreate(Sender: TObject);
begin
  inherited;
   if UpperCase(Copy(TForm(Sender).Caption, 1, 3)) = 'FRM' then
      TForm(Sender).Caption := 'Cadastro';
end;

end.
