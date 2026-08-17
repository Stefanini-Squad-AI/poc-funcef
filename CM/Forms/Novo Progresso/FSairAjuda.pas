unit FSairAjuda;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FTelaAut, ExtCtrls, MAHlpBtn, StdCtrls, Buttons, ComCtrls, uMenserro,
   ToolWin, TB97,TB97Tlbr, IvDictio, IvMulti, IvEMulti, ZipDir, Gauges,
   fcLabel;

type
   TfrmSairAjuda = class(TfrmTelaAutorizacao)
      pnlFundo: TPanel;
      Dock971: TDock97;
      tb97Fundo: TToolbar97;
      sep1: TToolbarSep97;
      bbtnSair: TBitBtn;
      bbtnAjuda: TmaHelpBitBtn;
      ToolbarSep971: TToolbarSep97;
      ToolbarSep972: TToolbarSep97;
      pnlPainelProgresso: TPanel;
      lblContadorProg: TLabel;
      lblLegendaProg: TfcLabel;
      lblContadorProg2: TLabel;
      lblLegendaProg2: TfcLabel;
      Animacao: TAnimate;
      btnCancelaProg: TBitBtn;
      pnlBarraProg: TPanel;
      ggeBarraProg: TGauge;
      pnlBarraProg2: TPanel;
      ggeBarraProg2: TGauge;
      Temporizador: TTimer;

      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure bbtnSairClick(Sender: TObject);
      procedure FormPaint(Sender: TObject);
      procedure btnCancelaProgClick(Sender: TObject);
      procedure TemporizadorTimer(Sender: TObject);


   private  // Private declarations

      FMaxProg       : Integer;
      FMinProg       : Integer;
      FPosProg       : Integer;
      FMaxProg2      : Integer;
      FMinProg2      : Integer;
      FPosProg2      : Integer;
      bCancelou      : Boolean;
      bVisivel       : Boolean;
      bHabilitado    : Boolean;
      sLegendaProg   : String;
      sLegendaProg2  : String;
      bTempo         : Boolean;

      procedure SetMaxProg(const iMax: Integer);
      procedure SetMaxProg2(const iMax: Integer);
      procedure SetMinProg(const iMin: Integer);
      procedure SetMinProg2(const iMin: Integer);
      procedure SetPosProg(const iPos: Integer);
      procedure SetPosProg2(const iPos: Integer);

      procedure SetHabilita(const Value: Boolean);
      procedure SetVisivel(const Value: Boolean);
      procedure SetLegendaProg(const Value: String);
      procedure SetLegendaProg2(const Value: String);


   protected

      property MaxProg          : Integer   read FMaxProg    write SetMaxProg;
      property MinProg          : Integer   read FMinProg    write SetMinProg;
      property PosProg          : Integer   read FPosProg    write SetPosProg;

      property MaxProg2         : Integer   read FMaxProg2   write SetMaxProg2;
      property MinProg2         : Integer   read FMinProg2   write SetMinProg2;
      property PosProg2         : Integer   read FPosProg2   write SetPosProg2;

      property Cancelou         : Boolean   read bCancelou;

      property LegendaProg      : String    read sLegendaProg  write SetLegendaProg;
      property LegendaProg2     : String    read sLegendaProg2 write SetLegendaProg2;

      property BotaoHabilitado  : Boolean   read bHabilitado  write SetHabilita;
      property BotaoVisivel     : Boolean   read bVisivel     write SetVisivel;

      procedure Temporiza(i: integer);

      procedure MostraPainelProgressoDuplo(const sLegenda    : String;
                                           const sLegenda2   : String;
                                           const fMinimo     : Integer;
                                           const fMinimo2    : Integer;
                                           const fMaximo     : Integer;
                                           const fMaximo2    : Integer;
                                           const bVisivel    : Boolean;
                                           const bHabilitado : Boolean
                                          );

      procedure AndaPainelProgressoDuplo(const fPosicao, fPosicao2: Integer);

      procedure EscondePainelProgressoDuplo;


   public   // Public declarations

      procedure DrawFundo; virtual;


   end;



var
  frmSairAjuda: TfrmSairAjuda;



implementation
{$R *.DFM}
uses
   uSistema;
   


procedure TfrmSairAjuda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Action := caFree;
end;



procedure TfrmSairAjuda.bbtnSairClick(Sender: TObject);
begin
   inherited;
   Close;
end;



procedure TfrmSairAjuda.FormPaint(Sender: TObject);
begin
   inherited;
   DrawFundo;
end;



procedure TfrmSairAjuda.DrawFundo;
begin
   if tb97Fundo <> nil then tb97Fundo.DockPos := width;
end;



procedure TfrmSairAjuda.SetMaxProg(const iMax: Integer);
begin
   if iMax < 0 then
   begin
      FMaxProg             := 0;
      ggeBarraProg.Visible := False;
      lblLegendaProg.Visible  := False;
      lblContadorProg.Visible  := False;
   end
   else
   begin
      FMaxProg             := iMax;
      ggeBarraProg.Visible := True;
      lblLegendaProg.Visible  := True;
      lblContadorProg.Visible  := True;
   end;

   ggeBarraProg.MaxValue := FMaxProg;
end;



procedure TfrmSairAjuda.SetMaxProg2(const iMax: Integer);
begin
   if iMax < 0 then
   begin
      FMaxProg2               := 0;
      ggeBarraProg2.Visible   := False;
      lblLegendaProg2.Visible    := False;
      lblContadorProg2.Visible    := False;
   end
   else
   begin
      FMaxProg2               := iMax;
      ggeBarraProg2.Visible   := True;
      lblLegendaProg2.Visible    := True;
      lblContadorProg2.Visible    := True;
   end;

   ggeBarraProg2.MaxValue := FMaxProg2;
end;



procedure TfrmSairAjuda.SetMinProg(const iMin: Integer);
begin
   ggeBarraProg.MinValue   := iMin;
   FMinProg                := iMin;
end;



procedure TfrmSairAjuda.SetMinProg2(const iMin: Integer);
begin
   ggeBarraProg2.MinValue  := iMin;
   FMinProg2               := iMin;
end;



procedure TfrmSairAjuda.SetPosProg(const iPos: Integer);
begin
   if iPos < 0 then
   begin
      ggeBarraProg.Visible    := False;
      lblLegendaProg.Visible  := False;
      lblContadorProg.Visible := False;
   end
   else
   begin
      if (iPos >= FMinProg) and (iPos <= FMaxProg) then
      begin
         ggeBarraProg.Visible := True;
         lblLegendaProg.Visible  := True;
         lblContadorProg.Visible  := True;

         ggeBarraProg.Progress:= iPos;
         FPosProg             := iPos;
         lblContadorProg.Caption  := FormatFloat('#0', FPosProg) + ' de ' + FormatFloat('#0', FMaxProg);
      end;
   end;

//   Repaint;
   Application.ProcessMessages;
end;



procedure TfrmSairAjuda.SetPosProg2(const iPos: Integer);
begin
   if iPos < 0 then
   begin
      ggeBarraProg2.Visible   := False;
      lblLegendaProg2.Visible    := False;
      lblContadorProg2.Visible    := False;
   end
   else
   begin
      if (iPos >= FMinProg2) and (iPos <= FMaxProg2) then
      begin
         ggeBarraProg2.Visible   := True;
         lblLegendaProg2.Visible    := True;
         lblContadorProg2.Visible    := True;

         ggeBarraProg2.Progress  := iPos;
         FPosProg2               := iPos;
         lblContadorProg2.Caption    := FormatFloat('#0', FPosProg2) + ' de ' + FormatFloat('#0', FMaxProg2);
      end;
   end;

//   Repaint;
   Application.ProcessMessages;
end;



procedure TfrmSairAjuda.SetHabilita(const Value: Boolean);
begin
   bHabilitado          := Value;
   btnCancelaProg.Enabled  := bHabilitado;

   Repaint;
end;



procedure TfrmSairAjuda.SetVisivel(const Value: Boolean);
begin
   bVisivel             := Value;
   btnCancelaProg.Visible  := bVisivel;

   Repaint;
end;



procedure TfrmSairAjuda.SetLegendaProg(const Value: String);
begin
   lblLegendaProg.Caption  := Value;
   lblContadorProg.Caption  := FormatFloat('#0', 0) + ' de ' + FormatFloat('#0', FMaxProg);

   Repaint;
end;



procedure TfrmSairAjuda.SetLegendaProg2(const Value: String);
begin
   lblLegendaProg2.Caption := Value;
   lblContadorProg2.Caption := FormatFloat('#0', 0) + ' de ' + FormatFloat('#0', FMaxProg2);

   Repaint;
end;



procedure TfrmSairAjuda.Temporiza(i: integer);
begin
   bTempo := False;

   Temporizador.Interval := i * 1000;
   Temporizador.Enabled  := True;

   repeat
      Application.ProcessMessages;
   until
      bTempo;

   Temporizador.Enabled  := False;
end;



procedure TfrmSairAjuda.MostraPainelProgressoDuplo(const sLegenda    : String;
                                             const sLegenda2   : String;
                                             const fMinimo     : Integer;
                                             const fMinimo2    : Integer;
                                             const fMaximo     : Integer;
                                             const fMaximo2    : Integer;
                                             const bVisivel    : Boolean;
                                             const bHabilitado : Boolean
                                            );
begin
   // --------------------------------------------------------------------------

   MinProg           := fMinimo;
   MinProg2          := fMinimo2;
   MaxProg           := fMaximo;
   MaxProg2          := fMaximo2;

   BotaoVisivel      := bVisivel;
   BotaoHabilitado   := bHabilitado;

   LegendaProg           := sLegenda;
   LegendaProg2          := sLegenda2;

   pnlPainelProgresso.Visible := True;

   // --------------------------------------------------------------------------

   Animacao.Active            := True;
   bCancelou                  := False;

   ggeBarraProg.Progress      := FMinProg;
   ggeBarraProg2.Progress     := FMinProg2;

   Repaint;
   Application.ProcessMessages;

   // --------------------------------------------------------------------------
end;



procedure TfrmSairAjuda.AndaPainelProgressoDuplo(const fPosicao, fPosicao2: Integer);
begin
   PosProg  := fPosicao;
   PosProg2 := fPosicao2;

   Application.ProcessMessages;
end;



procedure TfrmSairAjuda.EscondePainelProgressoDuplo;
begin
   // --------------------------------------------------------------------------

   pnlPainelProgresso.Visible := False;

   // --------------------------------------------------------------------------

   Animacao.Active      := False;

   lblLegendaProg.Caption  := '';
   lblContadorProg.Caption  := FormatFloat('00000', 0) + ' de ' + FormatFloat('00000', 0);

   lblLegendaProg2.Caption := '';
   lblContadorProg2.Caption := FormatFloat('00000', 0) + ' de ' + FormatFloat('00000', 0);

   btnCancelaProg.Enabled  := True;

   Repaint;
   Application.ProcessMessages;

   // --------------------------------------------------------------------------
end;



procedure TfrmSairAjuda.btnCancelaProgClick(Sender: TObject);
begin
   btnCancelaProg.Enabled := False;

   if MsgDlg('Deseja realmente interromper a operação?', Sistema.NomeModulo,
              mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Repaint;
      bCancelou := True;

      lblLegendaProg.Caption   := 'Cancelando operação...';
      Repaint;
      Temporiza(1);

      Hide;
   end
   else
   begin
      btnCancelaProg.Enabled := True;
      Repaint;
   end;

   Application.ProcessMessages;
end;



procedure TfrmSairAjuda.TemporizadorTimer(Sender: TObject);
begin
   inherited;
   bTempo := True;
end;



end.
