{

--------------------------------------------------------------------------------
Pendência   : SOL 213592 Kintana 2040335
Responsável : Sadi Freire
Data        : 16/12/2013
Descrição   : Alterações Voto Empréstimo
--------------------------------------------------------------------------------
Pendência   : SOL 146774 KINTANA 1004129
Responsável : BRUNO AZEVEDO
Data        : 05/11/2010
Descrição   : Forçar abrir uma transação para comitar anterior.
              O empréstimo utiliza o bde como "AutoComit", porém, caso alguma máquina
              esteja configurada como "NoAutoComit", o módulo trava. Este ajuste
              foi feito junto ao SAULO, da getif, pois não encontramos uma melhor
              solução nestas transações.
--------------------------------------------------------------------------------
}
unit FCadastroGridCSImob;

//	------------------------------------------------------------------------------------------------
//
//	   Cadastro Grid CS Imobiliário
//
//	Autor          :  André Pontes
//	Data de Início :
//	Data de Término:
//
//	Modificações	:  14/11/2000  1) pnlControles.SendToBack no FormShow
//
// -------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, CmEventosCadastro, ImgList;

type
  TfrmCadastroGridCSImob = class(TFrmCadastroGridCS)
    ToolbarSep972: TToolbarSep97;
    btnRefresh: TToolbarButton97;
    btnTrazer: TToolbarButton97;                                
    ToolbarSep973: TToolbarSep97;                   
    ToolbarSep974: TToolbarSep97;
    ToolbarSep975: TToolbarSep97;

    procedure btnRefreshClick(Sender: TObject);
    procedure btnTrazerClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure dbGrdTopRowChanged(Sender: TObject);
    procedure dbGrdCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure CmeCadastroConfirma(Sender: TObject);

  protected { Protected declarations }

   procedure FazerRefresh; virtual;
   procedure FazerTrazer; virtual;
   procedure FechaQueries; virtual;


  private { Private declarations }

  public { Public declarations }

  end;



var
  frmCadastroGridCSImob: TfrmCadastroGridCSImob;



implementation

uses
  DBaseDados;
  
{$R *.DFM}



procedure TfrmCadastroGridCSImob.FazerRefresh;
begin
   // ------------------------------------
   //    implementação nos descendentes
   // ------------------------------------
end;



procedure TfrmCadastroGridCSImob.FazerTrazer;
begin
   // ------------------------------------
   //    implementação nos descendentes
   // ------------------------------------
end;



procedure TfrmCadastroGridCSImob.FechaQueries;
var
   i : integer;
begin
   i := 0;

   while i <= (ComponentCount - 1) do begin

      if ( (TObject(Components[i]).ClassType = TwwQuery) and (TwwQuery(Components[i]).Active) ) then begin
         TwwQuery(Components[i]).Close;
      end;

      inc(i);
   end;
end;



procedure TfrmCadastroGridCSImob.btnRefreshClick(Sender: TObject);
begin
   inherited;

   try
      FazerRefresh;
   finally

      // não deixa o botão ficar pressionado
      btnRefresh.Down := False;
   end;
end;



procedure TfrmCadastroGridCSImob.btnTrazerClick(Sender: TObject);
begin
   inherited;

   FazerTrazer;

   // não deixa o botão ficar pressionado
   btnTrazer.Down := False;
end;



procedure TfrmCadastroGridCSImob.FormShow(Sender: TObject);
begin
   pnlControles.SendToBack;
   inherited;
end;



procedure TfrmCadastroGridCSImob.sbtnApagarClick(Sender: TObject);
begin
   try
      inherited;
   finally
      sbtnApagar.Down := False;
   end;
end;



procedure TfrmCadastroGridCSImob.dbGrdCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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



procedure TfrmCadastroGridCSImob.dbGrdTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmCadastroGridCSImob.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  //BRUNO AZEVEDO SOL 146774 KINTANA 1004129
  //O empréstimo utiliza o bde como "AutoComit", porém, caso alguma máquina
  //esteja configurada como "NoAutoComit", o módulo trava. Este ajuste
  //foi feito junto ao SAULO, da getif, pois não encontramos uma melhor
  //solução nestas transações.
  if not(dtmBaseDados.dbBaseDados.InTransaction) then begin
    dtmBaseDados.dbBaseDados.StartTransaction;
    dtmBaseDados.dbBaseDados.Rollback;
  end;
end;

end.
