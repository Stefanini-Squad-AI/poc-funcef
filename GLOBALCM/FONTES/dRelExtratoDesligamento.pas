{===============================================================================
Data      : 25/06/2013
Autor     : Thiago Melo
Pendência : SOL 210051 Kintana 2026065
Descrição : Alterar a visualização das informações no relatório
================================================================================
Data      : 25/04/2013
Autor     : Thiago Melo
Pendência : SOL 205352 Kintana 1989160
Descrição : Alterar texto dos itens 3 e 4
================================================================================}



unit dRelExtratoDesligamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt, ppModule, raCodMod, ppParameter,
  DBClient, uCMClientDataSet, ppMemo;

type


  TdtmRelExtratoDesligamento = class(TdtmReports)
    ppRelDesligamento: TppReport;
    ppParameterList1: TppParameterList;
    ppRegReplan: TppDBPipeline;
    dsRegReplan: TwwDataSource;
    cds: TCMClientDataSet;
    ppDetailBand1: TppDetailBand;
    ppSubRegReplan: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppShape19: TppShape;
    ppShape21: TppShape;
    ppShape25: TppShape;
    ppShape26: TppShape;
    ppShape27: TppShape;
    ppShape28: TppShape;
    ppShape29: TppShape;
    ppShape30: TppShape;
    ppShape31: TppShape;
    ppShape32: TppShape;
    ppShape33: TppShape;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel32: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppLabel2: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppSubRegReplan2: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppDetailBand5: TppDetailBand;
    ppShape34: TppShape;
    ppShape35: TppShape;
    ppShape36: TppShape;
    ppShape39: TppShape;
    ppShape40: TppShape;
    ppShape41: TppShape;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel48: TppLabel;
    ppShape49: TppShape;
    ppShape37: TppShape;
    ppShape38: TppShape;
    ppLabel46: TppLabel;
    ppShape45: TppShape;
    ppLabel47: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppShape46: TppShape;
    ppShape48: TppShape;
    ppShape50: TppShape;
    ppLabel53: TppLabel;
    ppLabel55: TppLabel;
    ppShape54: TppShape;
    ppShape55: TppShape;
    ppShape56: TppShape;
    ppShape57: TppShape;
    ppShape58: TppShape;
    ppShape47: TppShape;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppShape52: TppShape;
    ppShape53: TppShape;
    ppShape59: TppShape;
    ppShape60: TppShape;
    ppShape61: TppShape;
    ppShape62: TppShape;
    ppShape69: TppShape;
    ppShape70: TppShape;
    ppLabel63: TppLabel;
    ppShape71: TppShape;
    ppLabel64: TppLabel;
    ppShape72: TppShape;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppShape73: TppShape;
    ppLabel68: TppLabel;
    ppShape74: TppShape;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppShape75: TppShape;
    ppShape76: TppShape;
    ppShape77: TppShape;
    ppShape78: TppShape;
    ppShape80: TppShape;
    ppShape81: TppShape;
    ppShape82: TppShape;
    ppShape84: TppShape;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLabel59: TppLabel;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText17: TppDBText;
    ppDBText19: TppDBText;
    ppDBText21: TppDBText;
    ppDBText23: TppDBText;
    ppDBText25: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    lblNaoElegivelSALRegReplan: TppLabel;
    lblNaoElegivelResgateRegReplan: TppLabel;
    lblNaoElegivelPortabilidadeRegReplan: TppLabel;
    ppSummaryBand4: TppSummaryBand;
    raCodeModule4: TraCodeModule;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText9: TppDBText;
    ppLabel214: TppLabel;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppLabel217: TppLabel;
    ppDBText97: TppDBText;
    ppLabel220: TppLabel;
    ppDBText100: TppDBText;
    ppLabel223: TppLabel;
    ppLabel54: TppLabel;
    ppLabel88: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLabel171: TppLabel;
    lblNaoElegivelBPDRegReplan: TppLabel;
    ppMemo1: TppMemo;
    ppSummaryBand1: TppSummaryBand;
    raCodeModule3: TraCodeModule;
    ppSubNovoPLano: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    ppShape85: TppShape;
    ppShape86: TppShape;
    ppShape87: TppShape;
    ppShape88: TppShape;
    ppShape89: TppShape;
    ppShape90: TppShape;
    ppLabel1: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppShape91: TppShape;
    ppShape92: TppShape;
    ppShape93: TppShape;
    ppShape94: TppShape;
    ppShape95: TppShape;
    ppShape96: TppShape;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppShape100: TppShape;
    ppShape101: TppShape;
    ppLabel89: TppLabel;
    ppShape102: TppShape;
    ppLabel91: TppLabel;
    ppShape103: TppShape;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppShape104: TppShape;
    ppLabel96: TppLabel;
    ppShape105: TppShape;
    ppLabel95: TppLabel;
    ppLabel97: TppLabel;
    ppShape106: TppShape;
    ppLabel98: TppLabel;
    ppSubNovoPLano2: TppSubReport;
    ppChildReport5: TppChildReport;
    ppTitleBand5: TppTitleBand;
    ppDetailBand6: TppDetailBand;
    ppShape107: TppShape;
    ppShape108: TppShape;
    ppShape109: TppShape;
    ppShape110: TppShape;
    ppShape111: TppShape;
    ppShape112: TppShape;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppLabel102: TppLabel;
    ppLabel103: TppLabel;
    ppShape116: TppShape;
    ppShape117: TppShape;
    ppShape118: TppShape;
    ppLabel105: TppLabel;
    ppShape119: TppShape;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    ppLabel109: TppLabel;
    ppShape120: TppShape;
    ppShape121: TppShape;
    ppShape122: TppShape;
    ppLabel110: TppLabel;
    ppLabel111: TppLabel;
    ppShape123: TppShape;
    ppShape124: TppShape;
    ppShape125: TppShape;
    ppShape128: TppShape;
    ppLabel113: TppLabel;
    ppLabel114: TppLabel;
    ppLabel115: TppLabel;
    ppShape130: TppShape;
    ppShape131: TppShape;
    ppShape132: TppShape;
    ppShape133: TppShape;
    ppShape142: TppShape;
    ppShape143: TppShape;
    ppLabel119: TppLabel;
    ppShape144: TppShape;
    ppLabel120: TppLabel;
    ppShape145: TppShape;
    ppLabel121: TppLabel;
    ppLabel122: TppLabel;
    ppLabel123: TppLabel;
    ppLabel124: TppLabel;
    ppShape146: TppShape;
    ppShape147: TppShape;
    ppLabel125: TppLabel;
    ppShape126: TppShape;
    ppLabel116: TppLabel;
    ppShape127: TppShape;
    ppLabel117: TppLabel;
    ppLabel126: TppLabel;
    ppShape134: TppShape;
    ppLabel127: TppLabel;
    ppLabel128: TppLabel;
    ppShape135: TppShape;
    ppShape140: TppShape;
    ppShape141: TppShape;
    ppLabel129: TppLabel;
    ppLabel130: TppLabel;
    ppLabel131: TppLabel;
    ppShape149: TppShape;
    ppShape150: TppShape;
    ppShape151: TppShape;
    ppLabel132: TppLabel;
    ppLabel133: TppLabel;
    ppLabel134: TppLabel;
    ppShape152: TppShape;
    ppShape153: TppShape;
    ppShape154: TppShape;
    ppLabel135: TppLabel;
    ppLabel136: TppLabel;
    ppLabel137: TppLabel;
    ppShape155: TppShape;
    ppShape156: TppShape;
    ppShape157: TppShape;
    ppLabel138: TppLabel;
    ppLabel139: TppLabel;
    ppLabel140: TppLabel;
    ppShape158: TppShape;
    ppShape159: TppShape;
    ppShape160: TppShape;
    ppLabel141: TppLabel;
    ppLabel142: TppLabel;
    ppLabel143: TppLabel;
    ppShape163: TppShape;
    ppDBText45: TppDBText;
    ppDBText47: TppDBText;
    ppDBText49: TppDBText;
    ppLabel108: TppLabel;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppDBText59: TppDBText;
    ppDBText61: TppDBText;
    ppDBText63: TppDBText;
    ppDBText65: TppDBText;
    lblNaoElegivelSALNovoPlano: TppLabel;
    lblNaoElegivelPortabilidadeNovoPlano: TppLabel;
    lblNaoElegivelResgateNovoPlano: TppLabel;
    ppSummaryBand5: TppSummaryBand;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppLabel215: TppLabel;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText42: TppDBText;
    ppDBText44: TppDBText;
    ppLabel99: TppLabel;
    ppLabel218: TppLabel;
    ppDBText98: TppDBText;
    ppLabel221: TppLabel;
    ppDBText101: TppDBText;
    ppLabel104: TppLabel;
    ppLabel112: TppLabel;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    lblNaoElegivelBPDNovoPlano: TppLabel;
    ppMemo4: TppMemo;
    ppMemo5: TppMemo;
    ppSummaryBand2: TppSummaryBand;
    ppSubReb: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppDetailBand4: TppDetailBand;
    ppShape164: TppShape;
    ppShape165: TppShape;
    ppShape166: TppShape;
    ppShape167: TppShape;
    ppShape168: TppShape;
    ppShape169: TppShape;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel147: TppLabel;
    ppLabel148: TppLabel;
    ppLabel149: TppLabel;
    ppShape170: TppShape;
    ppShape171: TppShape;
    ppShape172: TppShape;
    ppShape173: TppShape;
    ppShape174: TppShape;
    ppShape175: TppShape;
    ppLabel151: TppLabel;
    ppLabel152: TppLabel;
    ppLabel153: TppLabel;
    ppLabel154: TppLabel;
    ppShape179: TppShape;
    ppShape180: TppShape;
    ppLabel156: TppLabel;
    ppShape181: TppShape;
    ppLabel158: TppLabel;
    ppShape182: TppShape;
    ppLabel160: TppLabel;
    ppLabel161: TppLabel;
    ppShape183: TppShape;
    ppLabel162: TppLabel;
    ppShape184: TppShape;
    ppLabel163: TppLabel;
    ppLabel164: TppLabel;
    ppShape185: TppShape;
    ppLabel165: TppLabel;
    ppLabel166: TppLabel;
    ppSubReb2: TppSubReport;
    ppChildReport6: TppChildReport;
    ppTitleBand6: TppTitleBand;
    ppDetailBand7: TppDetailBand;
    ppShape186: TppShape;
    ppShape187: TppShape;
    ppShape188: TppShape;
    ppShape189: TppShape;
    ppShape190: TppShape;
    ppShape191: TppShape;
    ppLabel167: TppLabel;
    ppLabel168: TppLabel;
    ppLabel169: TppLabel;
    ppLabel170: TppLabel;
    ppShape195: TppShape;
    ppShape196: TppShape;
    ppShape197: TppShape;
    ppLabel172: TppLabel;
    ppShape198: TppShape;
    ppLabel173: TppLabel;
    ppLabel174: TppLabel;
    ppLabel176: TppLabel;
    ppShape199: TppShape;
    ppShape200: TppShape;
    ppLabel177: TppLabel;
    ppShape202: TppShape;
    ppShape203: TppShape;
    ppShape204: TppShape;
    ppLabel178: TppLabel;
    ppLabel179: TppLabel;
    ppShape205: TppShape;
    ppShape206: TppShape;
    ppShape207: TppShape;
    ppShape208: TppShape;
    ppLabel181: TppLabel;
    ppLabel182: TppLabel;
    ppLabel183: TppLabel;
    ppShape210: TppShape;
    ppShape211: TppShape;
    ppShape212: TppShape;
    ppShape213: TppShape;
    ppShape218: TppShape;
    ppShape219: TppShape;
    ppLabel185: TppLabel;
    ppShape220: TppShape;
    ppLabel186: TppLabel;
    ppShape221: TppShape;
    ppLabel187: TppLabel;
    ppLabel188: TppLabel;
    ppLabel189: TppLabel;
    ppLabel190: TppLabel;
    ppShape222: TppShape;
    ppLabel191: TppLabel;
    ppShape223: TppShape;
    ppLabel192: TppLabel;
    ppLabel193: TppLabel;
    ppShape224: TppShape;
    ppLabel194: TppLabel;
    ppLabel195: TppLabel;
    ppShape225: TppShape;
    ppShape226: TppShape;
    ppShape227: TppShape;
    ppLabel196: TppLabel;
    ppLabel197: TppLabel;
    ppLabel198: TppLabel;
    ppShape228: TppShape;
    ppShape229: TppShape;
    ppShape230: TppShape;
    ppLabel199: TppLabel;
    ppLabel200: TppLabel;
    ppLabel201: TppLabel;
    ppShape231: TppShape;
    ppShape232: TppShape;
    ppShape233: TppShape;
    ppLabel202: TppLabel;
    ppLabel203: TppLabel;
    ppLabel204: TppLabel;
    ppShape234: TppShape;
    ppShape235: TppShape;
    ppShape236: TppShape;
    ppLabel205: TppLabel;
    ppLabel206: TppLabel;
    ppLabel207: TppLabel;
    ppShape237: TppShape;
    ppShape238: TppShape;
    ppShape239: TppShape;
    ppLabel208: TppLabel;
    ppLabel209: TppLabel;
    ppLabel210: TppLabel;
    ppShape242: TppShape;
    ppLabel213: TppLabel;
    ppDBText75: TppDBText;
    ppDBText76: TppDBText;
    ppDBText77: TppDBText;
    ppDBText78: TppDBText;
    ppDBText79: TppDBText;
    ppDBText83: TppDBText;
    ppDBText85: TppDBText;
    ppDBText87: TppDBText;
    ppDBText89: TppDBText;
    ppDBText91: TppDBText;
    ppDBText92: TppDBText;
    ppDBText93: TppDBText;
    ppDBText94: TppDBText;
    ppDBText96: TppDBText;
    ppLabel175: TppLabel;
    lblNaoElegivelSALREB: TppLabel;
    lblNaoElegivelPortabilidadeReb: TppLabel;
    lblNaoElegivelResgateReb: TppLabel;
    ppSummaryBand6: TppSummaryBand;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    ppDBText70: TppDBText;
    ppLabel216: TppLabel;
    ppDBText69: TppDBText;
    ppDBText72: TppDBText;
    ppDBText74: TppDBText;
    ppLabel219: TppLabel;
    ppDBText99: TppDBText;
    ppLabel222: TppLabel;
    ppDBText102: TppDBText;
    ppLabel144: TppLabel;
    ppLabel145: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    lblNaoElegivelBPDReb: TppLabel;
    ppMemo2: TppMemo;
    ppMemo3: TppMemo;
    ppSummaryBand3: TppSummaryBand;
    raCodeModule1: TraCodeModule;
    raCodeModule2: TraCodeModule;
    ppMemo6: TppMemo;
    ppMemo7: TppMemo;
    ppMemo8: TppMemo;
    ppMemo9: TppMemo;
    ppMemo10: TppMemo;
    procedure ppRelDesligamentoBeforePrint(Sender: TObject);
    procedure ppLabel149Print(Sender: TObject);
    procedure ppDBText1GetText(Sender: TObject; var Text: String);
    procedure ppDBText2GetText(Sender: TObject; var Text: String);
    procedure ppDBText3GetText(Sender: TObject; var Text: String);
    procedure ppDBText4GetText(Sender: TObject; var Text: String);
    procedure ppDBText10GetText(Sender: TObject; var Text: String);
    procedure ppDBText11GetText(Sender: TObject; var Text: String);
    procedure ppDBText40GetText(Sender: TObject; var Text: String);
    procedure ppDBText42GetText(Sender: TObject; var Text: String);
    procedure ppDBText45GetText(Sender: TObject; var Text: String);
    procedure ppDBText47GetText(Sender: TObject; var Text: String);
    procedure ppDBText49GetText(Sender: TObject; var Text: String);
    procedure ppDBText69GetText(Sender: TObject; var Text: String);
    procedure ppDBText72GetText(Sender: TObject; var Text: String);
    procedure ppDBText77GetText(Sender: TObject; var Text: String);
    procedure ppDBText78GetText(Sender: TObject; var Text: String);
    procedure ppDBText79GetText(Sender: TObject; var Text: String);
    procedure GetTextGeral(Sender: TObject; var Text: String);
  private
    { Private declarations }
  public

    bRegReplan : Boolean;
    bNovoPlano : Boolean;
    bReb       : Boolean;
    bRegReplanSaldado : Boolean;
    sMatricula,sNome,sdataRecisao : String;
    { Public declarations }
    Function MostraParam(Form : String):Boolean;OverRide;

  end;

var
  dtmRelExtratoDesligamento: TdtmRelExtratoDesligamento;

implementation
 uses uPExtratoDesligamento,fMostraRelat;
{$R *.DFM}

{ TdtmRelExtratoDesligamento }

function TdtmRelExtratoDesligamento.MostraParam(Form: String): Boolean;
var frm : TForm;
begin

  if (LowerCase(Form) <> '') then begin
    frm := TfrmPExtratoDesligamento.Create(Application);
  end else begin
    frm := nil;
  end;

  if frm = nil then begin
    Result := False;
    Exit;
  end;

  with frm do begin
    Result := (ShowModal = mrOk);
    Free;
  end;
end;

procedure TdtmRelExtratoDesligamento.ppRelDesligamentoBeforePrint(
  Sender: TObject);
begin
  inherited;

   //REG REPLAN
   ppSubRegReplan.Visible  := bRegReplan;
   ppSubRegReplan2.Visible := bRegReplan;

   //Novo Plano
   ppSubNovoPlano.Visible  := bNovoPlano;
   ppSubNovoPlano2.Visible := bNovoPlano;

   //REB
   ppSubReb.Visible        := bReb;
   ppSubReb2.Visible       := bReb;

end;

procedure TdtmRelExtratoDesligamento.ppLabel149Print(Sender: TObject);
begin
  inherited;

  if cds.FieldByname('PATROREB').asString = '1' then begin
    ppLabel149.Caption := 'Fundação dos Economiários Federais - FUNCEF';
  end else if cds.FieldByname('PATROREB').asString = '91008' then begin
    ppLabel149.Caption := 'Caixa Econômica Federal';
  end;


end;


procedure TdtmRelExtratoDesligamento.ppDBText1GetText(Sender: TObject;
  var Text: String);
begin
  inherited;

  //ppDBText1.Font.Color := clBlack;
  
  if Text = 'Não Elegível' then begin
    //ppDBText1.Font.Color := clActiveBorder;
  end;

end;

procedure TdtmRelExtratoDesligamento.ppDBText2GetText(Sender: TObject;
  var Text: String);
begin
  inherited;

  //ppDBText2.Font.Color := clBlack;

  if Text = 'Não Elegível' then begin
    //ppDBText2.Font.Color := clActiveBorder;
  end;

end;

procedure TdtmRelExtratoDesligamento.ppDBText3GetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  ppDBText3.Font.Color := clBlack;

  if Text = 'Não Elegível' then begin
    ppDBText3.Font.Color := clActiveBorder;
  end;

end;

procedure TdtmRelExtratoDesligamento.ppDBText4GetText(Sender: TObject;
  var Text: String);
begin
  inherited;

  ppDBText4.Font.Color := clBlack;

  if Text = 'Não Elegível' then begin
    ppDBText4.Font.Color := clActiveBorder;
  end;

end;

procedure TdtmRelExtratoDesligamento.ppDBText10GetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  ppDBText10.Font.Color := clBlack;

  if Text = 'Não Elegível' then begin
    ppDBText10.Font.Color := clActiveBorder;
  end;

end;

procedure TdtmRelExtratoDesligamento.ppDBText11GetText(Sender: TObject;
  var Text: String);
begin
  inherited;

  ppDBText11.Font.Color := clBlack;

  if Text = 'Não Elegível' then begin
    ppDBText11.Font.Color := clActiveBorder;
  end;

end;

procedure TdtmRelExtratoDesligamento.ppDBText40GetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  ppDBText40.Font.Color := clBlack;

  if Text = 'Não Elegível' then begin
    ppDBText40.Font.Color := clActiveBorder;
  end;

end;

procedure TdtmRelExtratoDesligamento.ppDBText42GetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  ppDBText42.Font.Color := clBlack;

  if Text = 'Não Elegível' then begin
    ppDBText42.Font.Color := clActiveBorder;
  end;

end;

procedure TdtmRelExtratoDesligamento.ppDBText45GetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  ppDBText45.Font.Color := clBlack;

  if Text = 'Não Elegível' then begin
    ppDBText45.Font.Color := clActiveBorder;
  end;

end;

procedure TdtmRelExtratoDesligamento.ppDBText47GetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  ppDBText47.Font.Color := clBlack;

  if Text = 'Não Elegível' then begin
    ppDBText47.Font.Color := clActiveBorder;
  end;

end;

procedure TdtmRelExtratoDesligamento.ppDBText49GetText(Sender: TObject;
  var Text: String);
begin
  inherited;

  ppDBText49.Font.Color := clBlack;

  if Text = 'Não Elegível' then begin
    ppDBText49.Font.Color := clActiveBorder;
  end;

end;

procedure TdtmRelExtratoDesligamento.ppDBText69GetText(Sender: TObject;
  var Text: String);
begin
  inherited;

  ppDBText69.Font.Color := clBlack;

  if Text = 'Não Elegível' then begin
    ppDBText69.Font.Color := clActiveBorder;
  end;

end;

procedure TdtmRelExtratoDesligamento.ppDBText72GetText(Sender: TObject;
  var Text: String);
begin
  inherited;

  ppDBText72.Font.Color := clBlack;

  if Text = 'Não Elegível' then begin
    ppDBText72.Font.Color := clActiveBorder;
  end;

end;

procedure TdtmRelExtratoDesligamento.ppDBText77GetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  ppDBText77.Font.Color := clBlack;

  if Text = 'Não Elegível' then begin
    ppDBText77.Font.Color := clActiveBorder;
  end;

end;

procedure TdtmRelExtratoDesligamento.ppDBText78GetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  ppDBText78.Font.Color := clBlack;

  if Text = 'Não Elegível' then begin
    ppDBText78.Font.Color := clActiveBorder;
  end;

end;

procedure TdtmRelExtratoDesligamento.ppDBText79GetText(Sender: TObject;
  var Text: String);
begin
  inherited;

  ppDBText79.Font.Color := clBlack;

  if Text = 'Não Elegível' then begin
    ppDBText79.Font.Color := clActiveBorder;
  end;

end;

procedure TdtmRelExtratoDesligamento.GetTextGeral(Sender: TObject; var Text: String);
begin
  inherited;

  (Sender as TppDBText).Font.Color := clBlack;

  if Text = 'Não Elegível' then begin
    (Sender as TppDBText).Font.Color := clActiveBorder;
  end;

end;


end.
