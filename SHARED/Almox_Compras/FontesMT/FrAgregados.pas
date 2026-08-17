unit FrAgregados;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Wwdatsrc, StdCtrls, TREdit, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  DBClient, uCMClientDataSet, uCmSqlParams, uCtrlTipoAgregado;

type
  TFrameAgregados = class(TFrame)
    dsAgregados: TwwDataSource;
    cdsAgregados: TCMClientDataSet;
    sqlImpostoxProd: TCMSqlParams;
    cdsImpostoxProd: TCMClientDataSet;
    pnlTitulo: TPanel;
    grdAgreg: TwwDBGrid;
    plnEdAgreg: TPanel;
    Label25: TLabel;
    Label24: TLabel;
    Label23: TLabel;
    edAliquota: TDBRealEdit;
    edBaseCalc: TDBRealEdit;
    edValorAgreg: TDBRealEdit;
    procedure grdAgregExit(Sender: TObject);
    procedure edAliquotaExit(Sender: TObject);
    procedure edBaseCalcExit(Sender: TObject);
    procedure edValorAgregExit(Sender: TObject);
  private
    { Private declarations }
    rBase      : Double;
    rPerc      : Double;
    rValorImp  : Double;
  public
    { Public declarations }
    CodProduto   : String;
    CodEstado    : String;
    IdPais       : Double;
    rValorMerc   : Double;
    TipoAgregado : TCtrlTipoAgregado;
  end;

implementation

{$R *.DFM}

procedure TFrameAgregados.grdAgregExit(Sender: TObject);
begin
    If  (TForm(Owner).ActiveControl.Tag <> 99) and (plnEdAgreg.Enabled) Then
      Begin
         If (cdsAgregados.FieldByName('PERCVALOR').AsString <> 'P') or (cdsAgregados.FieldByName('PERCVALOR').isNull) Then
            Begin
               edAliquota.Enabled := False;
               edBaseCalc.Enabled := False;
               edValorAgreg.SetFocus;
            end
         Else
            Begin
               edAliquota.Enabled := True;
               edBaseCalc.Enabled := True;
               edAliquota.SetFocus;
            End;
         If edValorAgreg.Value = 0 then
            Begin
               rBase     := 0;
               rPerc     := 0;
               rValorImp := 0;
               TipoAgregado.CalcImposto( CodProduto,
                            CodEstado,
                            IdPais,
                            cdsAgregados.FieldByName('CODTIPOCUSTAGREG').asFloat,
                            cdsAgregados.FieldByName('BASE').asFloat);
               rBase     := TipoAgregado.BaseImp;
               rPerc     := TipoAgregado.PercImp;
               rValorImp := TipoAgregado.ValorImp;
               if rBase = 0 then
                  rBase := rValorMerc;
               edAliquota.Value   := rPerc;
               edBaseCalc.Value   := rBase;
               edValorAgreg.Value := rValorImp;
               cdsAgregados.Edit;
               cdsAgregados.FieldByName('PERCENT').asFloat  := rPerc;
               cdsAgregados.FieldByName('BASE').asFloat     := rBase;
               cdsAgregados.FieldByName('VALOR').asFloat    := rValorImp;
            End
         Else
            Begin
               rBase := cdsAgregados.FieldByName('BASE').AsFloat;
            end;
      End
   Else
      Begin
         If cdsAgregados.State in [dsInsert, dsEdit] Then
            cdsAgregados.Post;
      End;

end;

procedure TFrameAgregados.edAliquotaExit(Sender: TObject);
begin
  TipoAgregado.AtuBase(rBase);
end;

procedure TFrameAgregados.edBaseCalcExit(Sender: TObject);
begin
  edValorAgreg.Value := ((edAliquota.Value/100) * edBaseCalc.Value);
end;

procedure TFrameAgregados.edValorAgregExit(Sender: TObject);
Var
   bmMarca     : TbookMark;
   rAcumBase   : Double;
Begin
  inherited;
  If (cdsAgregados.FieldByName('FLGBASE').AsString = 'S') Then
    Begin
       If (cdsAgregados.FieldByName('CODTRATFISCE').AsString = '6') Then
          cdsAgregados.FieldByName('ACUMBASE').asFloat := edValorAgreg.Value * -1
       Else
          cdsAgregados.FieldByName('ACUMBASE').asFloat := edValorAgreg.Value;
       //
       cdsAgregados.Post;
       bmMarca   := cdsAgregados.GetBookmark;
       rAcumBase := 0;
       cdsAgregados.DisableControls;
       // Ver Valor total da base de calculo a ser abatido ou acrescido
       cdsAgregados.First;
       While Not cdsAgregados.EOF Do
          Begin
             rAcumBase := rAcumBase + cdsAgregados.FieldByName('ACUMBASE').AsFloat;
             cdsAgregados.Next;
          End;
       //
       cdsAgregados.First;
       While Not cdsAgregados.EOF Do
           Begin
              If (cdsAgregados.FieldByName('FLGBASE').AsString <> 'S') Then
                 Begin
                    cdsAgregados.Edit;
                    cdsAgregados.FieldByName('BASE').AsFloat  := rValorMerc + rAcumBase;
                    cdsAgregados.FieldByName('VALOR').AsFloat := (cdsAgregados.FieldByName('BASE').AsFloat * cdsAgregados.FieldByName('PERCENT').AsFloat) / 100;
                    cdsAgregados.Post;
                 End;
              cdsAgregados.Next;
           End;
       If cdsAgregados.BookmarkValid(bmMarca) Then
          Begin
             cdsAgregados.GotoBookmark(bmMarca);
             cdsAgregados.FreeBookmark(bmMarca);
          End;
       cdsAgregados.EnableControls;
       grdAgreg.RedrawGrid;
    End;
    If Not cdsAgregados.EOF Then
       Begin
          cdsAgregados.Next;
          grdAgreg.SetFocus;
       End;

end;

end.
