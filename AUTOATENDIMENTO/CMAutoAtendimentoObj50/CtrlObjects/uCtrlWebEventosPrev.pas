unit uCtrlWebEventosPrev;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes;

Type
  TCtrlWebEventosPrev = class(TCmControlObject)
  private

  protected

  public

    function SelecionaEventosPrev( iIdPessoa, iIdTitular: integer; bTodosPlanos : boolean ) : OleVariant;
    function SelecionaDadosEventosPrev( iIdEventosPrev : integer ) : OleVariant;
    function SelecionaContribEventosPrev( iIdEventosPrev : integer ) : OleVariant;    

  published

end;

implementation

{ TCtrlWebEventosPrev }

function TCtrlWebEventosPrev.SelecionaEventosPrev( iIdPessoa, iIdTitular: integer; bTodosPlanos : boolean ): OleVariant;
var
  sSQL : string;
begin
  sSQL :=
   ' select   ep.IDEVENTOSPREV,                           ' +
   '          eg.NOME,                                    ' +
   '          ep.DATAEVENTO,                              ' +
   '          ep.DATAREGISTRO,                            ' +
   '          ep.DATAEFETIVADO,                           ' +
   '          ep.DATAVOLTA,                               ' +
   '          ep.INSCRICAONUMERO,                         ' +
   '          pf.NOME as PATRO,                           ' +
   '          pl.NOME as PLANO                            ' +
   '   from   PESSOA pf,                                  ' +
   '          EVENTOSPREV ep,                             ' +
   '          EVENTOGERADOR eg,                           ' +
   '          SITPART sp1,                                ' +
   '          SITPART sp2,                                ' +
   '          SITFUNC sf1,                                ' +
   '          SITFUNC sf2,                                ' +
   '          SITPLANOPREV spl1,                          ' +
   '          SITPLANOPREV spl2,                          ' +
   '          PLANPREV pl,                                ' +
   '          PARTPREVPLAN pv                             ' +
   '   where  ep.IDPESSOA        = ' + IntToStr(iIdPessoa)  +
   '     and  ep.IDPESSOA        = ' + IntToStr(iIdTitular) +
   '     and  ep.IDPESSJUR       = pf.IDPESSOA            ' +
   '     and  ep.IDEVENTOGERADOR = eg.IDEVENTOGERADOR     ' +
   '     and  ep.IDSITPARTATUAL  = sp1.IDSITPART          ' +
   '     and  ep.IDSITPARTNOVO   = sp2.IDSITPART          ' +
   '     and  ep.IDSITFUNCATUAL  = sf1.IDSITFUNC          ' +
   '     and  ep.IDSITFUNCNOVO   = sf2.IDSITFUNC          ' +
   '     and  ep.IDSITPLANOATUAL = spl1.IDSITPLANOPREV    ' +
   '     and  ep.IDSITPLANONOVO  = spl2.IDSITPLANOPREV    ' +
   '     and  ep.IDPLANOPREV     = pl.IDPLANOPREV         ' +
   '     and  EP.IDPESSOA        = PV.IDPESSOA            ' +
   '     and  EP.IDPESSJUR       = PV.IDPESSJUR           ' +
   '     and  EP.IDPLANOPREV     = PV.IDPLANOPREV         ' +
   '     and  EP.SEQPROPOSTA     = PV.SEQPROPOSTA         ' ;

  if not bTodosPlanos then
    sSQL := sSQL +
     '     and  PV.FLGDESATIVADO   = 0                    ';

  sSQL := sSQL +
    ' order by PATRO,                                      ' +
    '          PLANO,                                      ' +
    '          ep.DATAEVENTO desc,                         ' +
    '          eg.NOME                                     ' ;

   Result := GetDataPacket( sSQL );
end;

function TCtrlWebEventosPrev.SelecionaDadosEventosPrev( iIdEventosPrev : integer ): OleVariant;
begin
   Result := GetDataPacket(
    ' select   ep.IDEVENTOSPREV,                           ' +
    '          eg.NOME,                                    ' +
    '          ep.DATAEVENTO,                              ' +
    '          ep.DATAREGISTRO,                            ' +
    '          ep.DATAEFETIVADO,                           ' +
    '          ep.DATAVOLTA,                               ' +
    '          ep.INSCRICAONUMERO,                         ' +
    '          sf1.DESCRICAO  as SITFUNCANT,               ' +
    '          spl1.DESCRICAO as SITPLANOANT,              ' +
    '          sp1.DESCRICAO  as SITPARTANT,               ' +
    '          sf2.DESCRICAO  as SITFUNCNOVO,              ' +
    '          spl2.DESCRICAO as SITPLANONOVO,             ' +
    '          sp2.DESCRICAO  as SITPARTNOVO,              ' +
    '          pf.NOME as PATRO,                           ' +
    '          pl.NOME as PLANO                            ' +
    '   from   PESSOA pf,                                  ' +
    '          EVENTOSPREV ep,                             ' +
    '          EVENTOGERADOR eg,                           ' +
    '          SITPART sp1,                                ' +
    '          SITPART sp2,                                ' +
    '          SITFUNC sf1,                                ' +
    '          SITFUNC sf2,                                ' +
    '          SITPLANOPREV spl1,                          ' +
    '          SITPLANOPREV spl2,                          ' +
    '          PLANPREV pl                                 ' +
    '   where  ep.IDEVENTOSPREV   = ' + IntToStr( iIdEventosPrev ) +
    '     and  ep.IDPESSJUR       = pf.IDPESSOA            ' +
    '     and  ep.IDEVENTOGERADOR = eg.IDEVENTOGERADOR     ' +
    '     and  ep.IDSITPARTATUAL  = sp1.IDSITPART          ' +
    '     and  ep.IDSITPARTNOVO   = sp2.IDSITPART          ' +
    '     and  ep.IDSITFUNCATUAL  = sf1.IDSITFUNC          ' +
    '     and  ep.IDSITFUNCNOVO   = sf2.IDSITFUNC          ' +
    '     and  ep.IDSITPLANOATUAL = spl1.IDSITPLANOPREV    ' +
    '     and  ep.IDSITPLANONOVO  = spl2.IDSITPLANOPREV    ' +
    '     and  ep.IDPLANOPREV = pl.IDPLANOPREV             ' +
    ' order by PATRO,                                      ' +
    '          PLANO,                                      ' +
    '          ep.DATAEVENTO desc,                         ' +
    '          eg.NOME                                     ' );
end;

function TCtrlWebEventosPrev.SelecionaContribEventosPrev( iIdEventosPrev : integer ): OleVariant;
begin
   Result := GetDataPacket(
    ' select   c.NOME AS CONTRIBUICAOF                ' +
    ' from     HSTCONTEVENTOSPR hst,                  ' +
    '          CONTRIBUICAO c                         ' +
    ' where    hst.IDEVENTOSPREV   = ' + IntToStr( iIdEventosPrev ) +
    '   and    hst.IDCONTRIBUICAOF = c.IDCONTRIBUICAO ' +
    ' order by CONTRIBUICAOF                          ' );
end;

end.
