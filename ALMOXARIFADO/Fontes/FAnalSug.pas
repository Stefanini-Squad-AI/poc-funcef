unit FAnalSug;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Grids,
  Wwdbigrd, Wwdbgrid, DBTables, Db, Wwdatsrc, Wwquery, TREdit, FOkCancelar,
  ComCtrls, IvDictio, IvMulti, IvEMulti;

type
  TFrmAnalSug = class(TfrmSairAjuda)
    grpItem: TGroupBox;
    dbGrdItem: TwwDBGrid;
    btnAceita: TBitBtn;
    BtnRecusar: TBitBtn;
    BtnSCI: TBitBtn;
    qryAux: TwwQuery;
    gbInformados: TGroupBox;
    Label1: TLabel;
    dbreTRM: TDBRealEdit;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    dbreCM: TDBRealEdit;
    BtConsMedCheck: TBitBtn;
    Label3: TLabel;
    dbrePR: TDBRealEdit;
    BtPtoRedCheck: TBitBtn;
    Label4: TLabel;
    dbreQM: TDBRealEdit;
    BtQtdeMinCheck: TBitBtn;
    Label5: TLabel;
    dbreQC: TDBRealEdit;
    Label6: TLabel;
    dbrePC: TDBRealEdit;
    procedure dbGrdItemExit(Sender: TObject);
    procedure btnAceitaClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure dbreTRMExit(Sender: TObject);
    procedure dbreTRMEnter(Sender: TObject);
    procedure dbreCMExit(Sender: TObject);
    procedure dbreCMEnter(Sender: TObject);
    procedure dbrePRExit(Sender: TObject);
    procedure dbrePREnter(Sender: TObject);
    procedure dbreQMExit(Sender: TObject);
    procedure dbreQMEnter(Sender: TObject);
    procedure dbGrdItemCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure BtTRMCheckClick(Sender: TObject);
    procedure BtConsMedCheckClick(Sender: TObject);
    procedure BtPtoRedCheckClick(Sender: TObject);
    procedure BtQtdeMinCheckClick(Sender: TObject);
    procedure BtnRecusarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnSCIClick(Sender: TObject);
    procedure dbreQCExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbreQCEnter(Sender: TObject);
  private
    procedure PegaVariaveis(sTRMCalc,sCMCalc,sPRCalc,sQMCalc:String;var rTRM,rCM,rPR,rQM:Double);
    procedure TrocaTRM;
    procedure TrocaCM;
    procedure TrocaPR;
    procedure TrocaQM;
    Function  PegaUN( sCodArtigo : String ) : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAnalSug : TFrmAnalSug;
  rValAnt    : Double;
  rCM,rPR,rQM,rTRM:Double;
  bPerc     : Boolean;
  bAceita   : Boolean;
implementation

{$R *.DFM}
 Uses FAnalEstoque, uMensErro, uDataBase, FSoliComp2, FTelaAut,
      uModulo;
procedure TFrmAnalSug.dbGrdItemExit(Sender: TObject);
begin
  inherited;
  FrmAnalEstoque.qryItem.Edit;

end;

procedure TFrmAnalSug.btnAceitaClick(Sender: TObject);
begin
  inherited;
    FrmAnalEstoque.bbtnConfirmarClick(Self);
     try
       StartTransacao;
       FrmAnalEstoque.qryItem.ApplyUpdates;
       CommitTransacao;
     except
       RollBacktransacao;
       MsgDlg('Gravacao não foi efetuada','Erro',mtError,[mbOK],0);
       Exit;
     end;
   bAceita := False;
   Close;
end;

procedure TFrmAnalSug.bbtnSairClick(Sender: TObject);
begin
  If Not bAceita Then
     Begin
         If MsgDlg('A análise não foi aceita deseja realmente sair. Ela será recusada','Atenção',MtWarning,[mbOK,MbCancel],0) = MrOK Then
             Begin
                FrmAnalEstoque.qryItem.CancelUpdates;
                FrmAnalEstoque.bbtnCancelarClick(Self);
             End
         Else
            Exit;
     End;
  inherited;

end;

procedure TFrmAnalSug.dbreTRMExit(Sender: TObject);
begin
  inherited;
  if Format('%17.2f',[rValAnt]) <> Format('%17.2f',[frmAnalEstoque.qryItem.FieldByName('TRMEDINFORMADO').AsFloat]) then
  Begin
     //
     frmAnalEstoque.qryItem.edit;
     frmAnalEstoque.qryItem.FieldByName('TRMEDINFORMADO').AsFloat:=dbreTRM.Value;
     frmAnalEstoque.qryItem.FieldByName('FLGTEMPMEDCALC').AsString:='N';
     frmAnalEstoque.qryItem.post;
     //
     TrocaTRM;
  end;
end;

procedure TFrmAnalSug.PegaVariaveis(sTRMCalc,sCMCalc,sPRCalc,sQMCalc:String;var rTRM,rCM,rPR,rQM:Double);
Begin
   If sTRMCalc = 'S' Then
      rTRM:= frmAnalEstoque.qryItem.FieldByName('TRMEDCALCULADO').AsFloat
   Else
      rTRM:= frmAnalEstoque.qryItem.FieldByName('TRMEDINFORMADO').AsFloat;
   //
   If sCMCalc = 'S' Then
      rCM:= frmAnalEstoque.qryItem.FieldByName('CONSMEDCALCULADO').AsFloat
   Else
      rCM:= frmAnalEstoque.qryItem.FieldByName('CONSMEDINFORMADO').AsFloat;
   //
   If sPRCalc = 'S' Then
      rPR:= frmAnalEstoque.qryItem.FieldByName('PONTOREPCALCULADO').AsFloat
   Else
      rPR:= frmAnalEstoque.qryItem.FieldByName('PONTOREPINFORMADO').AsFloat;
   //
   If sQMCalc = 'S' Then
      rQM:= frmAnalEstoque.qryItem.FieldByName('QTDEMINCALCULADA').AsFloat
   Else
      rQM:= frmAnalEstoque.qryItem.FieldByName('QTDEMININFORMADA').AsFloat;
   //
end;

procedure TFrmAnalSug.dbreTRMEnter(Sender: TObject);
begin
  inherited;
  FrmAnalEstoque.qryItem.Edit;
  rValAnt:=frmAnalEstoque.qryItem.FieldByName('TRMEDINFORMADO').AsFloat;
end;

procedure TFrmAnalSug.dbreCMExit(Sender: TObject);
begin
  inherited;
  if Format('%17.2f',[rValAnt]) <> Format('%17.2f',[frmAnalEstoque.qryItem.FieldByName('CONSMEDINFORMADO').AsFloat]) then
  Begin
     //
     frmAnalEstoque.qryItem.edit;
     frmAnalEstoque.qryItem.FieldByName('CONSMEDINFORMADO').AsFloat:=dbreCM.Value;
     frmAnalEstoque.qryItem.FieldByName('FLGCONSMEDCALC').AsString:='N';
     frmAnalEstoque.qryItem.post;
     //
     TrocaCM;
     //
  end;
end;

procedure TFrmAnalSug.dbreCMEnter(Sender: TObject);
begin
  inherited;
  FrmAnalEstoque.qryItem.Edit;
  rValAnt:=frmAnalEstoque.qryItem.FieldByName('CONSMEDINFORMADO').AsFloat;
end;

procedure TFrmAnalSug.dbrePRExit(Sender: TObject);
begin
  inherited;
  if Format('%17.2f',[rValAnt]) <> Format('%17.2f',[frmAnalEstoque.qryItem.FieldByName('PONTOREPINFORMADO').AsFloat]) then
  Begin
     //
     frmAnalEstoque.qryItem.edit;
     frmAnalEstoque.qryItem.FieldByName('PONTOREPINFORMADO').AsFloat:=dbrePR.Value;
     frmAnalEstoque.qryItem.FieldByName('FLGPONTOREPCALC').AsString:='N';
     frmAnalEstoque.qryItem.post;
     //
     TrocaPR;
  end;
end;

procedure TFrmAnalSug.dbrePREnter(Sender: TObject);
begin
  inherited;
  FrmAnalEstoque.qryItem.Edit;
  rValAnt:=frmAnalEstoque.qryItem.FieldByName('PONTOREPINFORMADO').AsFloat;
end;

procedure TFrmAnalSug.dbreQMExit(Sender: TObject);
begin
  inherited;
  if Format('%17.2f',[rValAnt]) <> Format('%17.2f',[frmAnalEstoque.qryItem.FieldByName('QTDEMININFORMADA').AsFloat]) then
  Begin
     //
     frmAnalEstoque.qryItem.edit;
     frmAnalEstoque.qryItem.FieldByName('QTDEMININFORMADA').AsFloat:=dbreQM.Value;
     frmAnalEstoque.qryItem.FieldByName('FLGQTDEMINCALC').AsString:='N';
     frmAnalEstoque.qryItem.post;
     //
     TrocaQM;
     TrocaPR;
  end;
end;

procedure TFrmAnalSug.dbreQMEnter(Sender: TObject);
begin
  inherited;
  FrmAnalEstoque.qryItem.Edit;
  rValAnt:=frmAnalEstoque.qryItem.FieldByName('QTDEMININFORMADA').AsFloat;
end;

procedure TFrmAnalSug.dbGrdItemCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  ABrush.color := clwhite;
  aFont.Color  := clSilver;
  Afont.Size   := 7;
  aFont.Name   := 'Arial';
 //Evento utilizado para mudar a cor das células de status de acordo
  With FrmAnalEstoque.qryItem Do
     Begin
          If FieldByName('FLGTEMPMEDCALC').asString = 'S' then
             Begin
                 If Field.Name = 'qryItemTRMEDCALCULADO' Then
                    aFont.Color := clBlue;
             End
          Else
             Begin
                 If Field.Name = 'qryItemTRMEDINFORMADO' Then
                    aFont.Color := clBlue;
             End;
         //
         If FieldByName('FLGCONSMEDCALC').asString = 'S' then
             Begin
                 If Field.Name = 'qryItemCONSMEDCALCULADO' Then
                    aFont.Color := clBlue;
             End
          Else
             Begin
                 If Field.Name = 'qryItemCONSMEDINFORMADO' Then
                    aFont.Color := clBlue;
             End;
         //
         If FieldByName('FLGPONTOREPCALC').asString = 'S' then
             Begin
                 If Field.Name = 'qryItemPONTOREPCALCULADO' Then
                    aFont.Color := clBlue;
             End
          Else
             Begin
                 If Field.Name = 'qryItemPONTOREPINFORMADO' Then
                    aFont.Color := clBlue;
             End;
         //
          If FieldByName('FLGQTDEMINCALC').asString = 'S' then
             Begin
                 If Field.Name = 'qryItemQTDEMINCALCULADA' Then
                    aFont.Color := clBlue;
             End
          Else
             Begin
                 If Field.Name = 'qryItemQTDEMININFORMADA' Then
                    aFont.Color := clBlue;
             End;
                 If Field.Name = 'qryItemPERIDOCOMPRA' Then
                    aFont.Color := clBlue;
          If Field.Name = 'qryItemQTDECOMPRAR' Then
                    aFont.Color := clBlue;
          If Field.Name = 'qryItemQTDESUGCALCULADA' Then
                    aFont.Color := clBlue;
          If Field.Name = 'qryItemQTDESUGAUTO' Then
                    aFont.Color := clBlue;
          If Field.Name = 'qryItemSALDOESTOQUE' Then
                    aFont.Color := clBlue;

     End;
   //Faz com que as linhas do grid tenham cores alternadas

   if State <> [gdSelected] then
      Begin
       If ( Field.Name = 'qryItemCODARTIGO' ) or ( Field.Name = 'qryItemDESCRICAO' ) Then
           Begin
             ABrush.Color := clwhite;
             aFont.Color  := clBlack;
           End;

       if  Highlight then
           begin
              if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
                   Begin
                      ABrush.color := clwhite;
                      aFont.Color  := clSilver;
                   End
              Else
                 Begin
                      ABrush.color := clwhite;
                      aFont.Color  := clSilver;
                 End;
           End;
       End
       Else
          Begin
             ABrush.Color := clHighlight;
             aFont.Color  := clHighlightText;
          End;
       If(gdSelected in State) And ( Highlight ) Then
          Begin
            If ( Field.Name = 'qryItemTRMEDCALCULADO' ) Then
               Begin
                   ABrush.Color := clHighlight;
                   aFont.Color  := clHighlightText;
                End;
     // Troca a cor dos itens Checados,quando o grid está selecionado
     With FrmAnalEstoque.qryItem Do
       Begin
           If FieldByName('FLGTEMPMEDCALC').asString = 'S' then
             Begin
                 If Field.Name = 'qryItemTRMEDCALCULADO' Then
                    aFont.Color := clAqua;
             End
          Else
             Begin
                 If Field.Name = 'qryItemTRMEDINFORMADO' Then
                    aFont.Color := clAqua;
             End;
         //
         If FieldByName('FLGCONSMEDCALC').asString = 'S' then
             Begin
                 If Field.Name = 'qryItemCONSMEDCALCULADO' Then
                    aFont.Color := clAqua;
             End
          Else
             Begin
                 If Field.Name = 'qryItemCONSMEDINFORMADO' Then
                    aFont.Color := clAqua;
             End;
         //
         If FieldByName('FLGPONTOREPCALC').asString = 'S' then
             Begin
                 If Field.Name = 'qryItemPONTOREPCALCULADO' Then
                    aFont.Color := clAqua;
             End
          Else
             Begin
                 If Field.Name = 'qryItemPONTOREPINFORMADO' Then
                    aFont.Color := clAqua;
             End;
         //
         If FieldByName('FLGQTDEMINCALC').asString = 'S' then
             Begin
                 If Field.Name = 'qryItemQTDEMINCALCULADA' Then
                    aFont.Color := clAqua;
             End
          Else
             Begin
                 If Field.Name = 'qryItemQTDEMININFORMADA' Then
                    aFont.Color := clAqua;
             End;
          If Field.Name = 'qryItemPERIDOCOMPRA' Then
               aFont.Color := clAqua;
          If Field.Name = 'qryItemQTDECOMPRAR' Then
               aFont.Color := clAqua;
          If Field.Name = 'qryItemQTDESUGCALCULADA' Then
               aFont.Color := clAqua;
          If Field.Name = 'qryItemQTDESUGAUTO' Then
               aFont.Color := clAqua;
          If Field.Name = 'qryItemSALDOESTOQUE' Then
               aFont.Color := clAqua;
        End;
    End;
end;

procedure TFrmAnalSug.BtTRMCheckClick(Sender: TObject);
begin
  inherited;
   frmAnalEstoque.qryItem.edit;
   if frmAnalEstoque.qryItem.FieldByName('FLGTEMPMEDCALC').AsString = 'N' then
      frmAnalEstoque.qryItem.FieldByName('FLGTEMPMEDCALC').AsString := 'S'
   else
      frmAnalEstoque.qryItem.FieldByName('FLGTEMPMEDCALC').AsString := 'N';
   frmAnalEstoque.qryItem.post;
   TrocaTRM;
end;

procedure TFrmAnalSug.TrocaTRM;
begin
     PegaVariaveis(frmAnalEstoque.qryItem.FieldByName('FLGTEMPMEDCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGCONSMEDCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGPONTOREPCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGQTDEMINCALC').AsString,rTRM,
                   rCM,rPR,rQM);
     //
     if frmAnalEstoque.qryItem.FieldByName('FLGQTDEMINCALC').AsString = 'S' then
        bPerc:=True
     else
        bPerc:=False;
     //
     frmAnalEstoque.qryItem.edit;
     frmAnalEstoque.qryItem.FieldByName('PONTOREPCALCULADO').AsFloat:=frmAnalEstoque.CalcPontoRep(rCM,frmAnalEstoque.dbedPercMin.Value,rQM,rTRM,bPerc);
     frmAnalEstoque.qryItem.post;
     //
     PegaVariaveis(frmAnalEstoque.qryItem.FieldByName('FLGTEMPMEDCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGCONSMEDCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGPONTOREPCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGQTDEMINCALC').AsString,rTRM,
                   rCM,rPR,rQM);
     frmAnalEstoque.qryItem.edit;
     frmAnalEstoque.qryItem.FieldByName('QTDEMINCALCULADA').AsFloat:=frmAnalEstoque.CalcQtdeMin(frmAnalEstoque.dbedPercMin.Value,rPR);
     frmAnalEstoque.qryItem.post;
     //
     PegaVariaveis(frmAnalEstoque.qryItem.FieldByName('FLGTEMPMEDCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGCONSMEDCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGPONTOREPCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGQTDEMINCALC').AsString,rTRM,
                   rCM,rPR,rQM);
     frmAnalEstoque.qryItem.edit;
     frmAnalEstoque.qryItem.FieldByName('QTDESUGCALCULADA').AsFloat :=frmAnalEstoque.CalcQtdeSug(rCM,rPR,frmAnalEstoque.qryItem.FieldByName('PERIDOCOMPRA').AsFloat,
                                frmAnalEstoque.qryItem.FieldByName('SALDOESTOQUE').AsFloat);
     frmAnalEstoque.qryItem.post;
     //
     frmAnalEstoque.qryItem.edit;
     frmAnalEstoque.qryItem.FieldByName('QTDECOMPRAR').AsFloat:=frmAnalEstoque.qryItem.FieldByName('QTDESUGCALCULADA').AsFloat;
     frmAnalEstoque.qryItem.post;
     //
     frmAnalEstoque.qryItem.edit;
end;

procedure TFrmAnalSug.TrocaCM;
begin
     PegaVariaveis(frmAnalEstoque.qryItem.FieldByName('FLGTEMPMEDCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGCONSMEDCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGPONTOREPCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGQTDEMINCALC').AsString,rTRM,
                   rCM,rPR,rQM);
     //
     if frmAnalEstoque.qryItem.FieldByName('FLGQTDEMINCALC').AsString = 'S' then
        bPerc:=True
     else
        bPerc:=False;
     //
     frmAnalEstoque.qryItem.edit;
     frmAnalEstoque.qryItem.FieldByName('PONTOREPCALCULADO').AsFloat:=frmAnalEstoque.CalcPontoRep(rCM,frmAnalEstoque.dbedPercMin.Value,rQM,rTRM,bPerc);
     frmAnalEstoque.qryItem.post;
     //
     PegaVariaveis(frmAnalEstoque.qryItem.FieldByName('FLGTEMPMEDCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGCONSMEDCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGPONTOREPCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGQTDEMINCALC').AsString,rTRM,
                   rCM,rPR,rQM);
     frmAnalEstoque.qryItem.edit;
     frmAnalEstoque.qryItem.FieldByName('QTDEMINCALCULADA').AsFloat:=frmAnalEstoque.CalcQtdeMin(frmAnalEstoque.dbedPercMin.Value,rPR);
     frmAnalEstoque.qryItem.post;
     //
     PegaVariaveis(frmAnalEstoque.qryItem.FieldByName('FLGTEMPMEDCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGCONSMEDCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGPONTOREPCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGQTDEMINCALC').AsString,rTRM,
                   rCM,rPR,rQM);
     frmAnalEstoque.qryItem.edit;
     frmAnalEstoque.qryItem.FieldByName('QTDESUGCALCULADA').AsFloat :=frmAnalEstoque.CalcQtdeSug(rCM,rPR,frmAnalEstoque.qryItem.FieldByName('PERIDOCOMPRA').AsFloat,
                                frmAnalEstoque.qryItem.FieldByName('SALDOESTOQUE').AsFloat);
     frmAnalEstoque.qryItem.post;
     //
     frmAnalEstoque.qryItem.edit;
     frmAnalEstoque.qryItem.FieldByName('QTDECOMPRAR').AsFloat:=frmAnalEstoque.qryItem.FieldByName('QTDESUGCALCULADA').AsFloat;
     frmAnalEstoque.qryItem.post;
     //
     frmAnalEstoque.qryItem.edit;
end;

procedure TFrmAnalSug.TrocaPR;
begin
     PegaVariaveis(frmAnalEstoque.qryItem.FieldByName('FLGTEMPMEDCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGCONSMEDCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGPONTOREPCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGQTDEMINCALC').AsString,rTRM,
                   rCM,rPR,rQM);
     //
     frmAnalEstoque.qryItem.edit;
     frmAnalEstoque.qryItem.FieldByName('QTDEMINCALCULADA').AsFloat:=frmAnalEstoque.CalcQtdeMin(frmAnalEstoque.dbedPercMin.Value,rPR);
     frmAnalEstoque.qryItem.post;
     //
     PegaVariaveis(frmAnalEstoque.qryItem.FieldByName('FLGTEMPMEDCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGCONSMEDCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGPONTOREPCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGQTDEMINCALC').AsString,rTRM,
                   rCM,rPR,rQM);
     //
     frmAnalEstoque.qryItem.edit;
     frmAnalEstoque.qryItem.FieldByName('QTDESUGCALCULADA').AsFloat :=frmAnalEstoque.CalcQtdeSug(rCM,rPR,frmAnalEstoque.qryItem.FieldByName('PERIDOCOMPRA').AsFloat,
                                frmAnalEstoque.qryItem.FieldByName('SALDOESTOQUE').AsFloat);
     frmAnalEstoque.qryItem.post;
     //
     frmAnalEstoque.qryItem.edit;
     frmAnalEstoque.qryItem.FieldByName('QTDECOMPRAR').AsFloat:=frmAnalEstoque.qryItem.FieldByName('QTDESUGCALCULADA').AsFloat;
     frmAnalEstoque.qryItem.post;
     //
     frmAnalEstoque.qryItem.edit;
end;

procedure TFrmAnalSug.TrocaQM;
begin
     PegaVariaveis(frmAnalEstoque.qryItem.FieldByName('FLGTEMPMEDCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGCONSMEDCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGPONTOREPCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGQTDEMINCALC').AsString,rTRM,
                   rCM,rPR,rQM);
     //
     if frmAnalEstoque.qryItem.FieldByName('FLGQTDEMINCALC').AsString = 'S' then
        bPerc:=True
     else
        bPerc:=False;
     //
     frmAnalEstoque.qryItem.edit;
     frmAnalEstoque.qryItem.FieldByName('PONTOREPCALCULADO').AsFloat:=frmAnalEstoque.CalcPontoRep(rCM,frmAnalEstoque.dbedPercMin.Value,rQM,rTRM,bPerc);
     frmAnalEstoque.qryItem.post;
     //
     PegaVariaveis(frmAnalEstoque.qryItem.FieldByName('FLGTEMPMEDCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGCONSMEDCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGPONTOREPCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGQTDEMINCALC').AsString,rTRM,
                   rCM,rPR,rQM);
     frmAnalEstoque.qryItem.edit;
     frmAnalEstoque.qryItem.FieldByName('QTDEMINCALCULADA').AsFloat:=frmAnalEstoque.CalcQtdeMin(frmAnalEstoque.dbedPercMin.Value,rPR);
     frmAnalEstoque.qryItem.post;
     //
     PegaVariaveis(frmAnalEstoque.qryItem.FieldByName('FLGTEMPMEDCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGCONSMEDCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGPONTOREPCALC').AsString,
                   frmAnalEstoque.qryItem.FieldByName('FLGQTDEMINCALC').AsString,rTRM,
                   rCM,rPR,rQM);
     frmAnalEstoque.qryItem.edit;
     frmAnalEstoque.qryItem.FieldByName('QTDESUGCALCULADA').AsFloat :=frmAnalEstoque.CalcQtdeSug(rCM,rPR,frmAnalEstoque.qryItem.FieldByName('PERIDOCOMPRA').AsFloat,
                                frmAnalEstoque.qryItem.FieldByName('SALDOESTOQUE').AsFloat);
     frmAnalEstoque.qryItem.post;
     //
     frmAnalEstoque.qryItem.edit;
     frmAnalEstoque.qryItem.FieldByName('QTDECOMPRAR').AsFloat:=frmAnalEstoque.qryItem.FieldByName('QTDESUGCALCULADA').AsFloat;
     frmAnalEstoque.qryItem.post;
     //
     frmAnalEstoque.qryItem.edit;
end;

procedure TFrmAnalSug.BtConsMedCheckClick(Sender: TObject);
begin
  inherited;
   frmAnalEstoque.qryItem.edit;
   if frmAnalEstoque.qryItem.FieldByName('FLGCONSMEDCALC').AsString = 'N' then
      frmAnalEstoque.qryItem.FieldByName('FLGCONSMEDCALC').AsString := 'S'
   else
      frmAnalEstoque.qryItem.FieldByName('FLGCONSMEDCALC').AsString := 'N';
   frmAnalEstoque.qryItem.post;
   TrocaCM;
end;

procedure TFrmAnalSug.BtPtoRedCheckClick(Sender: TObject);
begin
  inherited;
   frmAnalEstoque.qryItem.edit;
   if frmAnalEstoque.qryItem.FieldByName('FLGPONTOREPCALC').AsString = 'N' then
      frmAnalEstoque.qryItem.FieldByName('FLGPONTOREPCALC').AsString := 'S'
   else
      frmAnalEstoque.qryItem.FieldByName('FLGPONTOREPCALC').AsString := 'N';
   frmAnalEstoque.qryItem.post;
   TrocaPR;
end;

procedure TFrmAnalSug.BtQtdeMinCheckClick(Sender: TObject);
begin
  inherited;
   frmAnalEstoque.qryItem.edit;
   if frmAnalEstoque.qryItem.FieldByName('FLGQTDEMINCALC').AsString = 'N' then
      frmAnalEstoque.qryItem.FieldByName('FLGQTDEMINCALC').AsString := 'S'
   else
      frmAnalEstoque.qryItem.FieldByName('FLGQTDEMINCALC').AsString := 'N';
   frmAnalEstoque.qryItem.post;
   TrocaQM;
end;

procedure TFrmAnalSug.BtnRecusarClick(Sender: TObject);
begin
  inherited;
  FrmAnalEstoque.qryItem.CancelUpdates;
  FrmAnalEstoque.bbtnCancelarClick(Self);
  Close;
end;

procedure TFrmAnalSug.FormCreate(Sender: TObject);
begin
  inherited;
  bAceita := False;
end;
Function TFrmAnalSug.PegaUN( sCodArtigo : String ) : String;
Begin
    With qryAux Do
      Begin
          Close;
          Sql.Text :=' Select CodMedCusto From Produto Where ( CodProduto = '''+ Copy(sCodArtigo,1,6)+ ''')';
          Open;
          PegaUN := FieldByName('CodMedCusto').asString;
      End;
End;

procedure TFrmAnalSug.BtnSCIClick(Sender: TObject);
begin
  inherited;
  btnAceitaClick(Self);
  //
  Modulo.bVeioAnalise:=True;
  AbrirForm(FrmSoliComp2,TFrmSoliComp2,True);
  FrmSoliComp2.sbtnInserir.Click;
  With FrmSoliComp2.qryItemSoli Do
     Begin
        FrmAnalEstoque.qryItem.First;
        While Not FrmAnalEstoque.qryItem.Eof Do
           Begin
              if FrmAnalEstoque.qryItem.FieldByName('QTDECOMPRAR').AsFloat <> 0 then
              Begin
                 Append;
                 FieldByName('IDFORNE').AsInteger  := -1;
                 FieldByName('CodArtigo').asString := FrmAnalEstoque.qryItem.FieldByName('CodArtigo').asString;
                 FieldByName('CodMedida').asString := PegaUN( FrmAnalEstoque.qryItem.FieldByName('CodArtigo').asString );
                 FieldByName('ValorUN').asFloat    := Modulo.ConvertCustoMed(FieldByName('CodMedida').asString, Modulo.iCodAlmoxa, FrmAnalEstoque.qryItem.FieldByName('CodArtigo').asString);
                 FieldByName('QtdePedida').asFloat := FrmAnalEstoque.qryItem.FieldByName('QtdeComprar').asFloat;
                 FieldByName('Descricao').asString := FrmAnalEstoque.qryItem.FieldByName('Descricao').asString;
                 FieldByName('ValorTotal').asFloat := FieldByName('QtdePedida').asFloat *FieldByName('ValorUN').asFloat;
              end;
              FrmAnalEstoque.qryItem.Next;
           End;
      End;
  FrmSoliComp2.CalculaValorTotal;
  FrmSoliComp2.sbtnAltDet.Enabled    := True;
  FrmSoliComp2.sbtnExcluiDet.Enabled := True;

  //

end;

procedure TFrmAnalSug.dbreQCExit(Sender: TObject);
begin
  inherited;
     FrmAnalEstoque.qryItem.Post;
end;

procedure TFrmAnalSug.FormActivate(Sender: TObject);
begin
  inherited;
  FrmAnalEstoque.qryItem.First;
end;

procedure TFrmAnalSug.dbreQCEnter(Sender: TObject);
begin
  inherited;
  FrmAnalEstoque.qryItem.Edit;
end;

end.
