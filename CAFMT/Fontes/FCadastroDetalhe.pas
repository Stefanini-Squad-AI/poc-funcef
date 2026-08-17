unit FCadastroDetalhe;

//----------------------------------------------------------------------------------------
//
//	   Cadastro de Detalhes (Cadastro Mestre-Detalhe sem Mestre)
//
//       Esse from se destina a ser herdado por forMontaSelect que precisem cadastrar detalhes
//       (tabelas-filhas) de "pais" que já existam. Funciona aproximadamente como um
//       cadastro Mestre-Detalhe, mas onde não se cadastra nada do/no Mestre, apenas
//       no detalhe.
//
//
//	Autor             :	André Pontes
//	Data de Início    :  18/03/2000
//	Data de Término   :
//
//	Modificações      :  24/05/2000  3) DBGrid agora fica com linhas alternadas coloridas
//                                  4) Tirado o Tab do TabControl (TabVisible = False)
//                      16/11/2000  5) Criado procedimento virtual "FazerProcurar"
//
//----------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, Wwdatsrc, DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid,
  Buttons, ComCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  TB97Tlbr, TB97, ExtCtrls, CmEventosCadastro, uCMTypes;

type
  {TOperacao = (opVazio, opIdle, opInserir, opAlterar, opProcurar, opApagar);}

  TfrmCadastroDetalhe = class(TfrmOkCancelar)
    Panel1: TPanel;
    pgc: TPageControl;
    tbs: TTabSheet;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    sbtnInserir: TSpeedButton;
    sbtnAlterar: TSpeedButton;
    sbtnApagar: TSpeedButton;
    upd: TUpdateSQL;
    qry: TwwQuery;
    ds: TwwDataSource;
    pnlControles: TPanel;
    pnlGrd: TPanel;
    DBgrd: TwwDBGrid;
    CmeCadastro: TCmEventosCadastro;

    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure DBgrdCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBgrdTopRowChanged(Sender: TObject);

  private { Private declarations }

  protected { Protected declarations }
    procedure AtualizaBotoes; virtual;
    procedure HabilitaOkCancelar(bHabilita: Boolean); virtual;

    procedure AbreQueries; virtual;
    procedure FechaQueries; virtual;

    procedure FazerProcurar; virtual;
    procedure FazerInsert; virtual;
    procedure FazerEdit; virtual;
    procedure FazerConfirma; virtual;
    procedure FazerCancel; virtual;
    procedure FazerDelete; virtual;

  public { Public declarations }
    {OperacaoCadastro : TOperacao;}
    FazendoCloseOpen : Boolean;

  end;



var
  frmCadastroDetalhe: TfrmCadastroDetalhe;



implementation

{$R *.DFM}

Uses
   uMensErro, FSairAjuda, uDatabase, dBaseDados, uAutorizacao, uSistema;



procedure TfrmCadastroDetalhe.HabilitaOkCancelar(bHabilita: Boolean);
begin
   bbtnConfirmar.Enabled := bHabilita;
   bbtnCancelar.Enabled  := bHabilita;
end;



procedure TfrmCadastroDetalhe.AtualizaBotoes;
var
   ConfirmaVisible : Boolean;
begin
   { Configura o estado dos botões }

   sbtnInserir.Enabled  := False;
   sbtnAlterar.Enabled  := False;
   sbtnApagar.Enabled   := False;

   case CmeCadastro.Operacao of

      opVazio:
      begin
         sbtnInserir.Down     := False;
         sbtnAlterar.Down     := False;
         sbtnApagar.Down      := False;
         sbtnInserir.Enabled  := True;
         sbtnAlterar.Enabled  := False;
         sbtnApagar.Enabled   := False;

         ConfirmaVisible      := False;
      end;


      opIdle:
      begin
         HabilitaOkCancelar(False);

         sbtnInserir.Down     := False;
         sbtnAlterar.Down     := False;
         sbtnApagar.Down      := False;
         sbtnInserir.Enabled  := True;

         if ( (qry.Active) and (not(qry.IsEmpty)) )then begin
            sbtnAlterar.Enabled  := True;
            sbtnApagar.Enabled   := True;
         end else begin
            sbtnAlterar.Enabled  := False;
            sbtnApagar.Enabled   := False;
         end;

         ConfirmaVisible         := False;
      end;


      opInserir :
      begin
         HabilitaOkCancelar(True);

         sbtnInserir.Down     := True;
         sbtnInserir.Enabled  := True;
         ConfirmaVisible      := True;
      end;


      opAlterar :
      begin
         HabilitaOkCancelar(True);

         sbtnAlterar.Down     := True;
         sbtnAlterar.Enabled  := True;
         ConfirmaVisible      := True;
      end;


      opProcurar :
      begin
         HabilitaOkCancelar(True);
         ConfirmaVisible := False;
      end;


      opApagar :
      begin
         HabilitaOkCancelar(True);

         sbtnApagar.Down      := False;
         sbtnApagar.Enabled   := True;
         ConfirmaVisible      := False;
      end;


      else begin
         ConfirmaVisible   := False;

         HabilitaOkCancelar(True);
      end;

   end;

   bbtnConfirmar.Enabled   := ConfirmaVisible;
   bbtnCancelar.Enabled    := ConfirmaVisible;

   AutorizarForm(afSoDesabilitar);
end;



procedure TfrmCadastroDetalhe.FazerProcurar;
begin
   CmeCadastro.Operacao := opIdle;
   AtualizaBotoes;
end;



procedure TfrmCadastroDetalhe.AbreQueries;
begin
   //
end;


procedure TfrmCadastroDetalhe.FechaQueries;
begin
   //
end;



procedure TfrmCadastroDetalhe.FazerInsert;
begin
	AbreQueries;
   qry.Open;

   FazerCancel;
   qry.Insert;
end;



procedure TfrmCadastroDetalhe.FazerEdit;
begin
   qry.Edit;
end;



procedure TfrmCadastroDetalhe.FazerConfirma;
begin
   try
      qry.ApplyUpdates;
      qry.Close;
      qry.Open;
   except
      Raise;
      Repaint;
   end;
end;



procedure TfrmCadastroDetalhe.FazerCancel;
begin
   if qry.Active then qry.CancelUpdates;
end;



procedure TfrmCadastroDetalhe.FazerDelete;
begin
   qry.Delete;
   FazerConfirma;
end;





procedure TfrmCadastroDetalhe.sbtnInserirClick(Sender: TObject);
begin
   CmeCadastro.Operacao  := opInserir;

   AtualizaBotoes;
   FazerInsert;

   pnlControles.Enabled := True;
   pnlGrd.Enabled       := False;
end;



procedure TfrmCadastroDetalhe.sbtnAlterarClick(Sender: TObject);
begin
   if not(CmeCadastro.Operacao in [opIdle, opVazio]) then bbtnCancelarClick(Self);

   if not(qry.isEmpty) then begin
      CmeCadastro.Operacao := opAlterar;
      AtualizaBotoes;
      FazerEdit;

      pnlControles.Enabled := True;
      pnlGrd.Enabled       := False;
   end;
end;



procedure TfrmCadastroDetalhe.sbtnApagarClick(Sender: TObject);
begin
   try
      if CmeCadastro.Operacao = opIdle then begin
         CmeCadastro.Operacao := opApagar;
         AtualizaBotoes;

         if (MsgDlg('Deseja realmente excluir este registro?', 'Exclusão', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
            FazerDelete;
         end;

         if qry.IsEmpty then begin
            CmeCadastro.Operacao := opVazio;
         end else begin
            CmeCadastro.Operacao := opIdle;
         end;

      end;

      AtualizaBotoes;
   finally
      sbtnApagar.Down := False;
   end;
end;



procedure TfrmCadastroDetalhe.bbtnConfirmarClick(Sender: TObject);
begin
   FazerConfirma;

   if qry.IsEmpty then begin
      CmeCadastro.Operacao := opVazio
   end else begin
      CmeCadastro.Operacao := opIdle;
   end;

   AtualizaBotoes;

   inherited;

   pnlControles.Enabled := False;
   pnlGrd.Enabled       := True;
end;



procedure TfrmCadastroDetalhe.bbtnCancelarClick(Sender: TObject);
begin
   inherited;

   FazerCancel;

   if qry.isEmpty then begin
      CmeCadastro.Operacao  := opVazio
   end else begin
       CmeCadastro.Operacao := opIdle;
   end;

   AtualizaBotoes;

   pnlControles.Enabled := False;
   pnlGrd.Enabled       := True;
end;



procedure TfrmCadastroDetalhe.DBgrdCalcCellColors(Sender: TObject; Field: TField;
State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmCadastroDetalhe.DBgrdTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



end.
