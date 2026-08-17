unit FRelatContratos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmRelatContratos = class(TfrmOkCancelar)
    gbContratos: TGroupBox;
    Label2: TLabel;
    dtInicio: TCMDateTimePicker;
    dtFim: TCMDateTimePicker;
    rdTipoContratos: TRadioGroup;
    rdDatas: TRadioGroup;
    rdDataAV: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rdDatasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatContratos: TfrmRelatContratos;
  tipocontrato : string;

implementation
uses DRelatoriosContrato,USistema;
{$R *.DFM}

procedure TfrmRelatContratos.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  dtmRelatoriosContrato.qryEmpresa.Close;
  dtmRelatoriosContrato.qryEmpresa.ParamByName('idEmpresa').Value := Sistema.IdEmpresa;
  dtmRelatoriosContrato.qryEmpresa.Open;
  dtmRelatoriosContrato.rpNomeEmpresa.Caption := dtmRelatoriosContrato.qryEmpresaRAZAOSOCIAL.AsString;
  //
  dtmRelatoriosContrato.qryContratos.Close;

  dtmRelatoriosContrato.qryContratos.ParamByName('FLGCONTRATO').AsString:='_';
  dtmRelatoriosContrato.qryContratos.ParamByName('TIPOCONTRATO').AsString:='_';
  case rdTipoContratos.ItemIndex of
     0: dtmRelatoriosContrato.qryContratos.ParamByName('FLGCONTRATO').AsString:='TODOS';
     1: dtmRelatoriosContrato.qryContratos.ParamByName('TIPOCONTRATO').AsString:='N';
     2: dtmRelatoriosContrato.qryContratos.ParamByName('TIPOCONTRATO').AsString:='S';
     3: dtmRelatoriosContrato.qryContratos.ParamByName('TIPOCONTRATO').AsString:='E';
  end;

  dtmRelatoriosContrato.qryContratos.ParamByName('TIPODATA').AsString:='_';
  if rdDatas.ItemIndex=1 then
     case rdDataAV.ItemIndex of
        0: dtmRelatoriosContrato.qryContratos.ParamByName('TIPODATA').AsString:='DTASS';
        1: dtmRelatoriosContrato.qryContratos.ParamByName('TIPODATA').AsString:='DTVNC';
     end;

  dtmRelatoriosContrato.qryContratos.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
  dtmRelatoriosContrato.qryContratos.ParamByName('DTINICIO').AsDate := dtInicio.Date;
  dtmRelatoriosContrato.qryContratos.ParamByName('DTFIM').AsDate := dtFim.Date;
  dtmRelatoriosContrato.qryContratos.ParamByName('IDUSUARIO').AsString := IntToStr(Sistema.IDUsuario);
  dtmRelatoriosContrato.qryContratos.Open;
end;

procedure TfrmRelatContratos.rdDatasClick(Sender: TObject);
begin
  inherited;
   if rdDatas.ItemIndex = 1 then begin
       gbContratos.Enabled := true;
       rdDataAV.Enabled := true;       
       dtInicio.Color := clWindow;
       dtFim.Color := clWindow;
   end else begin
       gbContratos.Enabled := false;
       rdDataAV.Enabled := false;
       dtInicio.Color := clgray;
       dtFim.Color := clgray;
   end;
end;

end.



{SELECT C.NOMECONTRATO,C.IDFORCLI,P.NOME NOMEFORCLI,C.IDRESPONSAVEL,
  RS.NOME NOMERESP,C.DATAASSINATURA,C.DATABASECONTRATO,
  C.DATAPREVENCERRA,C.DATAEFETENCERRA,OI.IDITEM,I.NOME_ITEM,
  OI.IDOBJETO,O.NOMEOBJETO,OI.DATABASEITEM,OI.MOECODIGO,
  M.MOEDESC,OI.QTDEITEM,OI.VALORUNITARIOOBJETO,OI.VALORTOTALOBJETO,
  OI.DATAINICIOCOBR,OI.OBSERVACAO,
  C.VALORBASECONTRATO,DECODE (C.TIPOCONTRATO,'P','A Pagar','R','A Receber') TIPOC,
  DECODE (OI.FREQUENCIA,'M','mensal','U','unica','D','diaria','A','anual') FREQ,
  DECODE (i.tipocobranca, 'PQ','Sim','PV','Sim','EQ','Sim','EV','Sim','AQ','Sim','AV','Sim','Nao') TPCOB,
  R.PERCRATEIOCONTR, CC.NOME NOMECC
FROM CONTRATOCONTR C, OBJETOSXITEMCONTR OI, OBJETOCONTRATUAL O, ITEMCONTRATUAL I,
     RATEIOCENTROCUSTO R, CENTCUST CC, PESSOA P, PESSOA RS, MOEDA M
WHERE (C.IDPESSOA=P.IDPESSOA(+))
     AND (C.IDRESPONSAVEL=RS.IDPESSOA(+))
     AND (C.IDCONTRATO=OI.IDCONTRATO)
     AND (OI.IDITEM=I.IDITEM)
     AND (OI.IDOBJETO=O.IDOBJETO)
     AND (OI.MOECODIGO=M.MOECODIGO(+))
     AND (C.IDCONTRATO=R.IDCONTRATO)
     AND (OI.IDITEM=R.IDITEM)
     AND (OI.IDOBJETO=R.IDOBJETO)
     AND (R.IDEMPRESA=CC.IDEMPRESA)
     AND (R.CODCENTROCUSTO=CC.CODCENTROCUSTO)
ORDER BY C.NOMECONTRATO,O.NOMEOBJETO,I.NOME_ITEM,CC.NOME}

