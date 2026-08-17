unit FCadastroDetalhe;

//	-------------------------------------------------------------------------------------------------
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
//              Alex    20/03/2001  6) Conversão Delphi 5 c/ componente CMEventosCadastro
//
// -------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, Wwdatsrc, DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid,
  Buttons, ComCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  TB97Tlbr, TB97, ExtCtrls, CmEventosCadastro, FOkCancelarImob
  {$IFNDEF VERSAO0505}, uCMTypes {$ENDIF};

type
  TfrmCadastroDetalhe = class(TFrmOkCancelarImob)
    Panel1: TPanel;
    pgc: TPageControl;
    tbs: TTabSheet;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    sbtnInserir: TSpeedButton;
    sbtnAlterar: TSpeedButton;
    sbtnApagar: TSpeedButton;
    ds: TwwDataSource;
    pnlControles: TPanel;
    pnlGrd: TPanel;
    DBgrd: TwwDBGrid;
    CmeCadastro: TCmEventosCadastro;
    upd: TUpdateSql;
    qry: TwwQuery;

    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure DBgrdCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBgrdTopRowChanged(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);

  private { Private declarations }

  protected { Protected declarations }
    procedure HabilitaOkCancelar(bHabilita: Boolean); virtual;

    procedure AbreQueries; virtual;
    procedure FechaQueries; virtual;


  public { Public declarations }
    FazendoCloseOpen : Boolean;

  end;



var
  frmCadastroDetalhe: TfrmCadastroDetalhe;



implementation
{$R *.DFM}
uses
   uMensErro, FSairAjuda, uDatabase, dBaseDados, uAutorizacao, uSistema;



procedure TfrmCadastroDetalhe.HabilitaOkCancelar(bHabilita: Boolean);
begin
   bbtnConfirmar.Enabled := bHabilita;
   bbtnCancelar.Enabled  := bHabilita;
end;



procedure TfrmCadastroDetalhe.AbreQueries;
begin
   // ----------------------------------------------------------------------------------------------
   //    implementação nos descendentes
   // ----------------------------------------------------------------------------------------------
end;



procedure TfrmCadastroDetalhe.FechaQueries;
begin
   // ----------------------------------------------------------------------------------------------
   //    implementação nos descendentes
   // ----------------------------------------------------------------------------------------------
end;



procedure TfrmCadastroDetalhe.sbtnInserirClick(Sender: TObject);
begin
   CmeCadastro.Operacao  := opInserir;

   CmeCadastro.AtualizaBotoes(self);
   CmeCadastro.Insert(self);

   pnlControles.Enabled := True;
   pnlGrd.Enabled       := False;
end;



procedure TfrmCadastroDetalhe.sbtnAlterarClick(Sender: TObject);
begin
   if not(CmeCadastro.Operacao in [opIdle, opVazio]) then bbtnCancelarClick(Self);

   if not(qry.isEmpty) then begin
      CmeCadastro.Operacao := opAlterar;
      CmeCadastro.AtualizaBotoes(self);
      CmeCadastro.Edit(self);

      pnlControles.Enabled := True;
      pnlGrd.Enabled       := False;
   end;
end;



procedure TfrmCadastroDetalhe.sbtnApagarClick(Sender: TObject);
begin
   try
      if CmeCadastro.Operacao = opIdle then begin
         CmeCadastro.Operacao := opApagar;
         CmeCadastro.AtualizaBotoes(self);

         if (MsgDlg('Deseja realmente excluir este registro?', 'Exclusão', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
            CmeCadastro.Delete(self);
         end;

         if qry.IsEmpty then begin
            CmeCadastro.Operacao := opVazio;
         end else begin
            CmeCadastro.Operacao := opIdle;
         end;

      end;

      CmeCadastro.AtualizaBotoes(self);
   finally
      sbtnApagar.Down := False;
   end;
end;



procedure TfrmCadastroDetalhe.bbtnConfirmarClick(Sender: TObject);
var
  bInsert : boolean;
begin
   inherited;

   bInsert := CmeCadastro.RepetirInsert and (CmeCadastro.Operacao = opInserir);

   CmeCadastro.Confirma(self);

   if CmeCadastro.ConfirmaCadastro then begin
      if qry.IsEmpty then begin
         CmeCadastro.Operacao := opVazio
      end else begin
         CmeCadastro.Operacao := opIdle;
      end;

      if bInsert then
         sbtnInserir.Click
      else
         CmeCadastro.AtualizaBotoes(Self);

      pnlControles.Enabled := False;
      pnlGrd.Enabled       := True;
   end;
end;



procedure TfrmCadastroDetalhe.bbtnCancelarClick(Sender: TObject);
begin
   inherited;

   CmeCadastro.Cancel(self);

   if qry.isEmpty then begin
      CmeCadastro.Operacao  := opVazio
   end else begin
       CmeCadastro.Operacao := opIdle;
   end;

   CmeCadastro.AtualizaBotoes(self);

   pnlControles.Enabled := False;
   pnlGrd.Enabled       := True;
end;



procedure TfrmCadastroDetalhe.DBgrdCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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



procedure TfrmCadastroDetalhe.CmeCadastroAtualizaBotoes(Sender: TObject);
var
   ConfirmaVisible : Boolean;
begin
   inherited;

   { Configura o estado dos botões }

   sbtnInserir.Enabled  := False;
   sbtnAlterar.Enabled  := False;
   sbtnApagar.Enabled   := False;
   sbtnInserir.Down     := False;
   sbtnAlterar.Down     := False;
   sbtnApagar.Down      := False;

   case CmeCadastro.Operacao of

      opVazio:
      begin
{         sbtnInserir.Down     := False;
         sbtnAlterar.Down     := False;
         sbtnApagar.Down      := False;
}         sbtnInserir.Enabled  := True;
{         sbtnAlterar.Enabled  := False;
         sbtnApagar.Enabled   := False;
}
         ConfirmaVisible      := False;
      end;


      opIdle:
      begin
         HabilitaOkCancelar(False);

{         sbtnInserir.Down     := False;
         sbtnAlterar.Down     := False;
         sbtnApagar.Down      := False;
}         sbtnInserir.Enabled  := True;

         if ( (qry.Active) and (not(qry.IsEmpty)) )then begin
            sbtnAlterar.Enabled  := True;
            sbtnApagar.Enabled   := True;
{         end else begin
            sbtnAlterar.Enabled  := False;
            sbtnApagar.Enabled   := False;
}         end;

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

//         sbtnApagar.Down      := False;
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



procedure TfrmCadastroDetalhe.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   CmeCadastro.Operacao := opIdle;
   CmeCadastro.AtualizaBotoes(self);
end;



procedure TfrmCadastroDetalhe.CmeCadastroInsert(Sender: TObject);
begin
   inherited;

   AbreQueries;
   qry.Open;

   CmeCadastro.Cancel(self);
   qry.Insert;
end;



procedure TfrmCadastroDetalhe.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   qry.Edit;
end;



procedure TfrmCadastroDetalhe.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;
   AplicaAlteracoes([qry]);
end;



procedure TfrmCadastroDetalhe.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   if qry.Active then qry.CancelUpdates;
end;



procedure TfrmCadastroDetalhe.CmeCadastroDelete(Sender: TObject);
begin
   inherited;
   qry.Delete;
   CmeCadastro.Confirma(self);
end;



end.
